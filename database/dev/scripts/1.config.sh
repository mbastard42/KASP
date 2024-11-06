#!/bin/bash

# allow pgadmin-dev to connect to the server
PGADMIN_IP=$(getent hosts pgadmin-dev | awk '{ print $1 }')
echo "host    all             all             ${PGADMIN_IP}/32           trust" >> /var/lib/postgresql/data/pg_hba.conf

# allow backend-dev to connect to the server
BACKEND_IP=$(getent hosts pgadmin-dev | awk '{ print $1 }')
echo "host    all             all             ${BACKEND_IP}/32           trust" >> /var/lib/postgresql/data/pg_hba.conf