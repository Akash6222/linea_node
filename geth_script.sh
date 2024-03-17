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
    pkill -9 -f geth

    cd /root/

    # Remove genesis.json if it exists
    rm -rf genesis.json

    # Remove geth-linea-data
    rm -rf geth-linea-data/

    # Download genesis.json
    wget https://docs.linea.build/files/genesis.json

    # Execute geth with the provided parameters
    geth --datadir ./geth-linea-data init ./genesis.json
    geth --datadir $HOME/geth-linea-data --networkid 59144 --rpc.allow-unprotected-txs --txpool.accountqueue 50000 --txpool.globalqueue 50000 --txpool.globalslots 50000 --txpool.pricelimit 1000000 --txpool.pricebump 1 --txpool.nolocals --http --http.addr '127.0.0.1' --http.port 8545 --http.corsdomain '' --http.api 'web3,eth,txpool,net' --http.vhosts='' --ws --ws.addr '127.0.0.1' --ws.port 8546 --ws.origins '*' --ws.api 'web3,eth,txpool,net' --bootnodes "enode://ca2f06aa93728e2883ff02b0c2076329e475fe667a48035b4f77711ea41a73cf6cb2ff232804c49538ad77794185d83295b57ddd2be79eefc50a9dd5c48bbb2e@3.23.106.165:30303,enode://eef91d714494a1ceb6e06e5ce96fe5d7d25d3701b2d2e68c042b33d5fa0e4bf134116e06947b3f40b0f22db08f104504dd2e5c790d8bcbb6bfb1b7f4f85313ec@3.133.179.213:30303,enode://cfd472842582c422c7c98b0f2d04c6bf21d1afb2c767f72b032f7ea89c03a7abdaf4855b7cb2dc9ae7509836064ba8d817572cf7421ba106ac87857836fa1d1b@3.145.12.13:30303" --syncmode full --metrics --verbosity 3 --log.file geth_output.log
    
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
    pkill -9 -f geth

    cd /root/

    # Remove genesis.json if it exists
    rm -rf genesis.json

    # Remove geth-linea-data
    rm -rf geth-linea-data/

    # Download genesis.json
    wget https://docs.linea.build/files/genesis.json

    # Execute geth with the provided parameters
    geth --datadir ./geth-linea-data init ./genesis.json
    geth --datadir $HOME/geth-linea-data --networkid 59144 --rpc.allow-unprotected-txs --txpool.accountqueue 50000 --txpool.globalqueue 50000 --txpool.globalslots 50000 --txpool.pricelimit 1000000 --txpool.pricebump 1 --txpool.nolocals --http --http.addr '127.0.0.1' --http.port 8545 --http.corsdomain '' --http.api 'web3,eth,txpool,net' --http.vhosts='' --ws --ws.addr '127.0.0.1' --ws.port 8546 --ws.origins '*' --ws.api 'web3,eth,txpool,net' --bootnodes "enode://ca2f06aa93728e2883ff02b0c2076329e475fe667a48035b4f77711ea41a73cf6cb2ff232804c49538ad77794185d83295b57ddd2be79eefc50a9dd5c48bbb2e@3.23.106.165:30303,enode://eef91d714494a1ceb6e06e5ce96fe5d7d25d3701b2d2e68c042b33d5fa0e4bf134116e06947b3f40b0f22db08f104504dd2e5c790d8bcbb6bfb1b7f4f85313ec@3.133.179.213:30303,enode://cfd472842582c422c7c98b0f2d04c6bf21d1afb2c767f72b032f7ea89c03a7abdaf4855b7cb2dc9ae7509836064ba8d817572cf7421ba106ac87857836fa1d1b@3.145.12.13:30303" --syncmode full --metrics --verbosity 3 --log.file geth_output.log

fi
