#!/bin/bash

# System update
echo "🔄 System updating..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install curl if not installed
echo "📦 Installing curl..."
sudo apt-get install -y curl

# Install nvm (Node Version Manager)
echo "⬇️ Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# Load nvm in current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" || { echo "❌ Error loading nvm"; exit 1; }
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Node.js
echo "📦 Installing Node.js LTS..."
nvm install --lts --latest-npm || { echo "❌ Node.js installation failed"; exit 1; }
nvm use --lts
nvm alias default 'lts/*'

# Install build essentials
echo "🛠️ Installing build tools..."
sudo apt-get install -y build-essential

# Install global packages
echo "🌍 Installing global packages (yarn, pm2)..."
npm install -g yarn pm2 || { echo "❌ Global packages installation failed"; exit 1; }

# Verify installations
echo -e "\n✅ Installation complete!"
echo "Node.js: $(node -v) || { echo "❌ Node.js not found"; exit 1; }"
echo "npm: $(npm -v) || { echo "❌ npm not found"; exit 1; }"
echo "nvm: $(nvm --version) || { echo "❌ nvm not found"; exit 1; }"
echo "yarn: $(yarn -v) || { echo "❌ yarn not found"; exit 1; }"
echo "pm2: $(pm2 --version) || { echo "❌ pm2 not found"; exit 1; }"

# Reload shell configuration
echo -e "\n🔃 Run this command to refresh your shell:"
echo "source ~/.bashrc"
