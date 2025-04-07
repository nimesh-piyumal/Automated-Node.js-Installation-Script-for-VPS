#!/bin/bash

# System update
echo "Updating system..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install curl if not installed
sudo apt-get install -y curl

# Install nvm (Node Version Manager)
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# Load nvm immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install latest LTS Node.js
echo "Installing Node.js LTS version..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

# Install build essentials
echo "Installing build-essential..."
sudo apt-get install -y build-essential

# Verify installations
echo -e "\nInstallation complete!"
echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"
echo "nvm version: $(nvm --version)"
