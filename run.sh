#!/bin/bash

CLONE_DIR="linea_node"

# Move into the cloned directory
cd $CLONE_DIR

# Copy the linea_service.service to /etc/systemd/system/
sudo cp custom_linea.service /etc/systemd/system/

# Start the custom_linea.service
sudo systemctl start custom_linea.service

# Enable the custom_linea.service to start on boot
sudo systemctl enable custom_linea.service

# Copy the geth_script.sh script to /root/ directory
sudo cp geth_script.sh /root/

# Make sure the script is executable
sudo chmod +x /root/geth_script.sh

echo "Setup completed successfully."

