# !/usr/bin/env bash

while getopts ":h:p:help:" option
do
    case $option in
        h)  
            hostname=${OPTARG}     # Queries the host-name
            ;;
        p)  
            persist=${OPTARG}      # If "y" or "yes", keys are written to $HOME
            ;;
        help)  
            echo "Usage: ./decrypt-keys.sh [-h host_name] [-p persist]"
            echo "Host name should equal the file name of your sops file"
            echo "Persist writes age key to $HOME if 'y' or 'yes' is passed"
            echo "Example: ./decrypt-keys.sh -h host -p yes"
            exit 1
            ;;
    esac
done

homeDir=$HOME
tmpDir=/tmp/keys

mkdir -p ${tmpDir}

echo $homeDir
echo $tmpDir

nix-shell -p gnupg --run '\
    gpg \
    --keyserver hkps://keys.openpgp.org \
    --recv-keys C577B6C556EF76FA78E1B271E2AFF28AB89D48EC &&
    gpg \
    --decrypt ./secrets/'${hostname}'.gpg \
    > $tmpDir/id_ed25519 \
    '

if [ ${persist} = "y" ] || [ ${persist} = "yes" ];

    then
        nix-shell -p ssh-to-age --run '\
            ssh-to-age \
                -private-key \
                -i $tmpDir/id_ed25519 \
                -o $homeDir/keys.txt \
            '
    else
        nix-shell -p ssh-to-age --run '\
            ssh-to-age \
                -private-key \
                -i $tmpDir/id_ed25519 \
                -o $tmpDir/keys.txt \
        '        
fi
