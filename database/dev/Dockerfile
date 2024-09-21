FROM postgres:latest

WORKDIR /var/lib/postgresql/data/
COPY ./server .

RUN chown -R postgres .
RUN chmod -R 0700 .
USER postgres

ENTRYPOINT ["./launch.sh"]