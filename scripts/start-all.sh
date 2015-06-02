#!/bin/bash

cd ${0%/*}

echo "Starting new database container"
./start-blank-db.sh

sleep 2

echo "Starting spotweb server"
./create-server-container.sh

echo "Database Information"
source base.sh

IP_ADDRESS=$($docker_exec inspect --format='{{.NetworkSettings.IPAddress}}' ${db_ps})
echo "IP ADDRESS=$IP_ADDRESS"
for fn in $($docker_exec run $name_db env); do
        echo $fn
done
