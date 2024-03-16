#!/bin/bash

# Check if geth is running
if pgrep -x "geth" > /dev/null; then
    echo "geth is already running."

    # Find all geth processes that are in a stopped state and resume them
    pgrep -af geth | grep 'Tl' | awk '{print $1}' | while read pid; do
        echo "Resuming stopped geth process with PID: $pid"
        kill -CONT $pid
    done

    # Give the processes a moment to resume
    sleep 2

    # Now, forcefully kill all geth processes
    pkill -9 geth

    cd /root/

    # Remove genesis.json if it exists
    rm -rf genesis.json

    # Remove geth-linea-data
    rm -rf geth-linea-data/

    # Download genesis.json
    wget https://docs.linea.build/files/genesis.json

    # Execute geth with the provided parameters
    geth --datadir ./geth-linea-data init ./genesis.json
    geth --datadir $HOME/geth-linea-data --networkid 59144 --rpc.allow-unprotected-txs --txpool.accountqueue 50000 --txpool.globalqueue 50000 --txpool.globalslots 50000 --txpool.pricelimit 1000000 --txpool.pricebump 1 --txpool.nolocals --http --http.addr '127.0.0.1' --http.port 8545 --http.corsdomain '' --http.api 'web3,eth,txpool,net' --http.vhosts='' --ws --ws.addr '127.0.0.1' --ws.port 8546 --ws.origins '*' --ws.api 'web3,eth,txpool,net' --bootnodes "enode://..." --syncmode full --metrics --verbosity 3 --log.file geth_output.log  

else
    # If geth is not running, perform the following actions
    echo "geth is not running. Performing setup and starting geth."

    # Find all geth processes that are in a stopped state and resume them
    pgrep -af geth | grep 'Tl' | awk '{print $1}' | while read pid; do
        echo "Resuming stopped geth process with PID: $pid"
        kill -CONT $pid
    done

    # Give the processes a moment to resume
    sleep 2

    # Now, forcefully kill all geth processes
    pkill -9 geth

    cd /root/

    # Remove genesis.json if it exists
    rm -rf genesis.json

    # Remove geth-linea-data
    rm -rf geth-linea-data/

    # Download genesis.json
    wget https://docs.linea.build/files/genesis.json

    # Execute geth with the provided parameters
    geth --datadir ./geth-linea-data init ./genesis.json
    geth --datadir $HOME/geth-linea-data --networkid 59144 --rpc.allow-unprotected-txs --txpool.accountqueue 50000 --txpool.globalqueue 50000 --txpool.globalslots 50000 --txpool.pricelimit 1000000 --txpool.pricebump 1 --txpool.nolocals --http --http.addr '127.0.0.1' --http.port 8545 --http.corsdomain '' --http.api 'web3,eth,txpool,net' --http.vhosts='' --ws --ws.addr '127.0.0.1' --ws.port 8546 --ws.origins '*' --ws.api 'web3,eth,txpool,net' --bootnodes "enode://..." --syncmode full --metrics --verbosity 3 --log.file geth_output.log  
fi
