#!/bin/bash

# Exit on any error
set -e

# Update package list
sudo apt update

# Install .NET 6.0
echo "Installing .NET 6.0..."
sudo apt install -y aspnetcore-runtime-6.0
sudo apt install -y dotnet-sdk-6.0

# Install git an
echo "Installing git"
sudo apt install -y git

# Clone repository
cd /home/ubuntu
echo "Cloning repository..."
sudo sudo -u ubuntu git clone https://github.com/Passw0rd404/srv-02.git

# Change to project directory
cd srv-02

# Set DOTNET_CLI_HOME environment variable
echo "Setting up .NET environment..."
echo 'DOTNET_CLI_HOME=/tmp' >> /etc/environment
export DOTNET_CLI_HOME=/tmp

# Build and publish the .NET application
echo "Building .NET application..."
sudo -u ubuntu dotnet publish -c Release --self-contained=false --runtime linux-x64

# Find the actual DLL path (handle naming inconsistencies)
DLL_PATH=/home/ubuntu/srv-02/bin/Release/netcoreapp6/linux-x64/publish/srv02.dll
if [ -z "$DLL_PATH" ]; then
    echo "Error: Could not find the application DLL"
    exit 1
fi

echo "Found DLL at: $DLL_PATH"

# Create systemd service file with correct path
cat > /etc/systemd/system/srv-02.service << EOL
[Unit]
Description=Dotnet S3 info service
After=network.target

[Service]
Type=notify
ExecStart=/usr/bin/dotnet $DLL_PATH
Restart=always
RestartSec=5
SyslogIdentifier=srv-02
User=ubuntu
Environment=DOTNET_CLI_HOME=/tmp
Environment=ASPNETCORE_ENVIRONMENT=Production
WorkingDirectory=/home/ubuntu/srv-02/bin/Release/netcoreapp6/linux-x64/publish

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd and start service
echo "Starting service..."
sudo systemctl daemon-reload
sudo systemctl enable srv-02
sudo systemctl start srv-02

# Check service status
echo "Service status:"
sudo systemctl status srv-02 --no-pager

echo "Deployment completed!"