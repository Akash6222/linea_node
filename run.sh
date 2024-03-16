#!/bin/bash

# Copy the linea_service.service to /etc/systemd/system/
cp custom_linea.service /etc/systemd/system/

# Start the custom_linea.service
systemctl start custom_linea.service

# Enable the custom_linea.service to start on boot
systemctl enable custom_linea.service

# Copy the geth_script.sh script to /root/ directory
cp geth_script.sh /root/

# Make sure the script is executable
chmod +x /root/geth_script.sh

echo "Setup completed successfully."

