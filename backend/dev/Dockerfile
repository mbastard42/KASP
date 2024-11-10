FROM php:8.2-alpine

RUN apk add --no-cache \
        bash \
        git \
        zip \ 
        postgresql-dev

RUN docker-php-ext-install pdo pdo_pgsql

COPY ./confs/ /usr/local/etc/php/

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /app
COPY ./symfony .

EXPOSE 8000
ENTRYPOINT ["sh", "-c", "./tools/composer.phar install && php bin/console d:d:c && php bin/console d:m:m --no-interaction && ./tools/symfony server:start"]
