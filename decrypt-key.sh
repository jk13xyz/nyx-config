# !/usr/bin/env bash

while getopts h:p: flag
do
    case "${flag}" in
        h) hostname=${OPTARG};;     # Queries the host-name
        p) persist=${OPTARG};;      # If "y" or "yes", keys are written to $HOME
    esac
done

homeDir = "$HOME"
tmpDir = "/tmp/keys"

nix-shell -p gnupg --run '\
    mkdir -p ${tmpDir} &&
    gpg \
    --keyserver hkps://keys.openpgp.org \
    --recv-keys C577B6C556EF76FA78E1B271E2AFF28AB89D48EC &&
    gpg \
    --decrypt ./secrets/'${hostname}'.gpg \
    > ${tmpDir}/id_ed25519 \
    '

if [ ${persist} == "y" ] || [ ${persist} = "yes" ];

    then
        nix-shell -p ssh-to-age --run '\
            ssh-to-age \
                -private-key \
                -i ${tmpDir}/id_ed25519 \
                -o ${homeDir}/keys.txt \
            '
    else
        nix-shell -p ssh-to-age --run '\
            ssh-to-age \
                -private-key \
                -i ${tmpDir}/id_ed25519 \
                -o ${tmpDir}/keys.txt \
        '        
fi