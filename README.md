# Geth Node Setup

Hi! Welcome to the Geth Node Setup repository. This guide is crafted to assist you in setting up a Geth node with ease. Follow the instructions carefully, and you'll have your node up and running in no time.

## Prerequisites

Before proceeding, ensure you have the following installed on your system:
- OS - Ubuntu (Support for other distros will be added later)
- Git
- wget (for downloading files)

## Installation

To set up your Geth node, follow these steps:

1. **Clone the Repository**

   Open your terminal and clone the repository using the following command:

   ```bash
   git clone https://github.com/Akash6222/linea_node.git
   
2. **Run the Setup Script**

   Change to the project directory and execute the setup script:
   ```bash
   cd linea_node 
   ./run.sh

 3. **Check the Service Status**

    Confirm that the Geth node is active and running with:
    ```bash
    systemctl status custom_linea.service

### Usage
    
To interact with your Geth node, use the following command to open the Geth JavaScript console:

    ```bash
    geth attach /root/geth-linea-data/geth.ipc

### Status

Currently this repo is under development stage...


