# Automated-Node.js-Installation-Script-for-VPS
A bash script to automatically install the latest version of Node.js on your VPS using nvm. Perfect for quick setup and deployment.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh)" && source ~/.bashrc && nvm install --lts && nvm use --lts && node -v
```
