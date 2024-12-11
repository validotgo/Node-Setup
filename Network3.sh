#!/bin/bash

# Script Error Handling
set -e

# Navigate to Home Directory
cd ~

# Update Package List
sudo apt update -y

# Install WireGuard
sudo apt install -y wireguard

# Download the Network3 Node Archive
wget https://network3.io/ubuntu-node-v2.1.0.tar

# Extract the Archive
tar -xf ubuntu-node-v2.1.0.tar

# Navigate to the Extracted Directory
cd ubuntu-node

# Start the Node
sudo bash manager.sh up

# Generate Keys for the Node
sudo bash manager.sh key

# Completion Message
echo "WireGuard and Network3 Node setup completed successfully."
