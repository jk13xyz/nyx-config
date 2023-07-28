# !/usr/bin/env bash

while getopts ":h:p:" option
do
    case $option in
        h)  
            hostname=${OPTARG}     # Queries the host-name
            ;;
        p)  
            persist=${OPTARG}      # If "y" or "yes", keys are written to $HOME
            ;;
    esac
done

homeDir=$HOME
tmpDir=/tmp/keys

mkdir -p $tmpDir

if [ -z '$hostname' ];

then
    echo -e "You did not pass a host name. Please try again.\n
    \n
    Usage: ./nyx-decrypt.sh [-h host_name] [-p persist]\n
    \n
    Host name should equal the file name of your sops file\n
    \n
    Persist writes age key to $HOME if 'y' or 'yes' is passed\n
    Example: ./nyx-decrypt.sh -h host -p yes\n
    "
    exit 1

else

    if [ -f './secrets/'$hostname'.gpg' ];

    then
        nix-shell -p gnupg --run '\
            gpg \
            --keyserver hkps://keys.openpgp.org \
            --recv-keys C577B6C556EF76FA78E1B271E2AFF28AB89D48EC &&
            gpg \
            --decrypt ./secrets/'${hostname}'.gpg \
            > '$tmpDir'/id_ed25519 \
            '

        if [ $persist='y' ] || [ $persist='yes' ];

            then
                nix-shell -p ssh-to-age --run '\
                    ssh-to-age \
                        -private-key \
                        -i '$tmpDir'/id_ed25519 \
                        -o '$homeDir'/keys.txt \
                '
            else
                nix-shell -p ssh-to-age --run '\
                    ssh-to-age \
                        -private-key \
                        -i '$tmpDir'/id_ed25519 \
                        -o '$tmpDir'/keys.txt \
                ' 
        fi

        nix-shell -p at --run '\
            echo "The keys in '$tmpDir' will now be automatically deleted in 5 minutes" \
            rm -rf '$tmpDir' | at now + 5 minutes \
        '
        exit 1        

    else
        echo 'File ./secrets/$hostname.gpg was not found.'
        exit 1
    
    fi

fi