FROM postgres:latest

WORKDIR /var/lib/postgresql/

COPY ./scripts/ /docker-entrypoint-initdb.d/
COPY ./confs .

USER root
RUN chown -R postgres:postgres /var/lib/postgresql/ /docker-entrypoint-initdb.d/ && \
    chmod -R 0700 /var/lib/postgresql/ /docker-entrypoint-initdb.d/

USER postgres

EXPOSE 5432