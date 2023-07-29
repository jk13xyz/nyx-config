# !/usr/bin/env bash

while getopts ":h:p:" option
do
    case $option in
        h)  
            hostname=${OPTARG}      # Queries the host-name
            ;;
        p)  
            persist=${OPTARG}       # If "y" or "yes", keys are written to $HOME
            ;;
        k)
            publickey=${OPTARG}     # If pubkey is passed, use this one
    esac
done

homeDir=$HOME

# Checks if -k has been passed. If is, the value is written into the variable $pubKey. If not, my default public key is used.
# You can change the key in case you want to use the script in your workflow.

if [ ! -z publickey ];

then
    pubKey=$publickey

else
    pubKey="C577B6C556EF76FA78E1B271E2AFF28AB89D48EC"
fi

# Defines the temporary folder for the SSH and age private keys and creates the folder.

tmpDir=/tmp/keys
mkdir -p $tmpDir

# Checks if hostname if passed, if not, it checks if the encrypted file exists.

if [ ! -z '$hostname' ];

then

    if [ -f './secrets/'$hostname'.gpg' ];

    then
        nix-shell -p gnupg --run '\
            gpg \
            --keyserver hkps://keys.openpgp.org \
            --recv-keys '$pubKey' &&
            gpg \
            --decrypt ./secrets/'$hostname'.gpg \
            > '$tmpDir'/id_ed25519 \
            '
        # Checks whether the persistence flag has been passed.
        # If 'y' or 'yes', the script exports the age private key to $HOME
        # If not, the key will be written into the $tmpDir.
        # In both cases, $tmpDir is deleted after the script ran.

        if [ $persist='y' ] || [ $persist='yes' ];

            then
                nix-shell -p ssh-to-age --run '\
                    ssh-to-age \
                        -private-key \
                        -i '$tmpDir'/id_ed25519 \
                        -o '$homeDir'/keys.txt &&
                '
            else
                nix-shell -p ssh-to-age --run '\
                    ssh-to-age \
                        -private-key \
                        -i '$tmpDir'/id_ed25519 \
                        -o '$tmpDir'/keys.txt \                      
                ' 
        fi

        rm -rf $tmpDir
        echo "Decryption completed. The temporary folder: $tmpDir has been deleted"
        exit 1

    else
        # Error message if file didn't exist

        echo 'File ./secrets/$hostname.gpg was not found.'
        exit 1
    
    fi
else

    # Error message, if hostname hasn't been passed correctly

    echo -e "You did not pass a host name. Please try again.\n
    \n
    Usage: ./nyx-decrypt.sh [-h host_name] [ -k gpg_public_key ] [-p persist]\n
    \n
    Host name should equal the file name of your sops file\n
    \n
    Persist writes age key to $HOME if 'y' or 'yes' is passed\n
    Example: ./nyx-decrypt.sh -h host -p yes\n
    "
    exit 1

fi