# /bin/bash

while getopts h: flag
do
    case "${flag}" in
        h) hostname=${OPTARG};;
    esac
done

nix-shell -p gnupg --run '\
    mkdir -p /tmp/keys &&
    gpg \
    --keyserver hkps://keys.openpgp.org \
    --recv-keys C577B6C556EF76FA78E1B271E2AFF28AB89D48EC &&
    gpg \
    --decrypt ./secrets/'${hostname}'.gpg \
    > /tmp/keys/id_ed25519 \
    '