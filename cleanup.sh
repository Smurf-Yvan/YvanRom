#!/bin/bash

# Remove Docker images
docker rmi $(docker images -q)

# Remove specified directories
sudo -E rm -rf /usr/share/dotnet /etc/mysql /etc/php /etc/apt/sources.list.d /usr/local/lib/android

# Update apt
sudo -E apt update

# Purge specified packages
sudo -E apt -y purge azure-cli* docker* ghc* zulu* llvm* firefox google* dotnet* powershell* openjdk* mysql* php* mongodb* dotnet* snap*

# Autoremove unused packages
sudo apt autoremove

# Clean up
sudo apt autoclean
sudo apt clean
sudo rm /var/log/*.log
sudo rm -rf /tmp/*

# Reload systemctl daemon
sudo -E systemctl daemon-reload

# Autoremove and clean again
sudo -E apt -y autoremove --purge
sudo -E apt clean