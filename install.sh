#!/bin/bash

# Function to ask for user confirmation
ask_confirm() {
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes (y) or no (n).";;
        esac
    done
}

# Ask if the user wants to update the system
if ask_confirm "Do you want to update the system before installation?"; then
    echo "Updating system..."
    sudo apt-get update -y
    sudo apt-get upgrade -y
else
    echo "Skipping system update."
fi

# Ask if the user wants to install Node.js
if ask_confirm "Do you want to install the latest version of Node.js?"; then
    echo "Installing Node.js..."

    # Install curl if not already installed
    sudo apt-get install -y curl

    # Install nvm (Node Version Manager)
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

    # Load nvm
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install the latest version of Node.js
    nvm install node

    # Set the latest version as default
    nvm alias default node

    # Verify installation
    echo "Node.js version: $(node -v)"
    echo "npm version: $(npm -v)"
else
    echo "Skipping Node.js installation."
fi

# Ask if the user wants to install additional packages
if ask_confirm "Do you want to install additional packages (e.g., build-essential)?"; then
    echo "Installing additional packages..."
    sudo apt-get install -y build-essential
else
    echo "Skipping additional packages installation."
fi

echo "Installation process completed!"
