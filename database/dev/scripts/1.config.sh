#!/bin/bash

# apply the config without compromising the launch of the entrypoint
mv /var/lib/postgresql/*.conf /var/lib/postgresql/data/

# allow pgadmin-dev to connect to the server
PGADMIN_IP=$(getent hosts pgadmin-dev | awk '{ print $1 }')
echo "host    all             all             ${PGADMIN_IP}/32           trust" >> /var/lib/postgresql/data/pg_hba.conf