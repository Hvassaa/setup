#!/usr/bin/env bash

# Run me with bash: bash setup.stuff.sh

# vi-flavoured inputrc
echo "Setting $HOME/.inputrc"
cp ./inputrc $HOME/.inputrc

# add nvidia-status script
local_bin=$HOME/.local/bin
nvstat_location=$local_bin/nvstat

echo -e "\nAdding $nvstat_location"
mkdir -p $local_bin
cp ./nvstat $nvstat_location
chmod +x $nvstat_location

# create ssh keypair
echo -e "\nCreating ssk-keypair"
read -p "Enter comment for keypair: " comment
ssh-keygen -t ed25519 -C $comment

# make sure nvidia optimus d3 runtime works
conf_location=/etc/modprobe.d/nvidia.conf
echo -e "\nSetting $conf_location, needs sudo:"
sudo cp ./nvidia.conf $conf_location
