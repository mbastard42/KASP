FROM postgres:17.0-alpine

WORKDIR /var/lib/postgresql/

COPY ./scripts/ /docker-entrypoint-initdb.d/

USER root
RUN chown -R postgres:postgres /var/lib/postgresql/ /docker-entrypoint-initdb.d/ && \
    chmod -R 0700 /var/lib/postgresql/ /docker-entrypoint-initdb.d/

USER postgres

EXPOSE 5432