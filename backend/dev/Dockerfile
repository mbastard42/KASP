FROM php:8.3

RUN apt update -y && apt upgrade -y
RUN apt install -y \
        git \
        zip

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /app
COPY ./symfony .
RUN ./tools/composer.phar install

EXPOSE 8000
ENTRYPOINT ["./tools/symfony", "server:start"]