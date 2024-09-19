FROM php:8.3

WORKDIR /app
COPY ./symfony .
RUN ./tools/composer.phar install

EXPOSE 8000

ENTRYPOINT ["./tools/symfony", "server:start"]
