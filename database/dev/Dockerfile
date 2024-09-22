FROM postgres:latest

WORKDIR /var/lib/postgresql/data/

USER postgres
RUN initdb

COPY ./confs .
COPY ./scripts /docker-entrypoint-initdb.d

USER root
RUN chown -R postgres .
RUN chmod -R 0700 .
USER postgres

EXPOSE 5432