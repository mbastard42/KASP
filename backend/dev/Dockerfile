FROM php:8.3

WORKDIR /app
COPY ./symfony .
RUN ./tools/composer.phar install

ENTRYPOINT ["./tools/symfony", "server:start"]
