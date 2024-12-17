#!/bin/bash

# Script Error Handling
set -e

# Navigate to Home Directory
cd ~

# Install WireGuard
sudo apt install -y wireguard

# Download the Network3 Node Archive
wget https://network3.io/ubuntu-node-v2.1.1.tar.gz

# Extract the Archive
tar -xf ubuntu-node-v2.1.1.tar.gz

# Install Net Tools
sudo apt-get install -y net-tools

# Navigate to the Extracted Directory
cd ubuntu-node

# Start the Node
sudo bash manager.sh up

# Generate Keys for the Node
sudo bash manager.sh key

# Remove the ubuntu-node-v2.1.1.tar archive
echo "Kurulum tamamlandı, ubuntu-node-v2.1.1.tar dosyası siliniyor..."
rm -f ~/ubuntu-node-v2.1.1.tar.gz

# Remove the script itself (Network3.sh)
echo "Script dosyası (Network3.sh) siliniyor..."
rm -- "$0"

# Completion Message
echo "WireGuard and Network3 Node setup completed successfully."
