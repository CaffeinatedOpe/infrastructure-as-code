echo "configuring node $1 at ip $2"
ssh lucy@$2 "hyfetch"
nixos-rebuild switch --sudo --build-host $2 --target-host $2 --flake "./nix#cerberus-$1"
echo "deployment complete!"
