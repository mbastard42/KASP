FROM php:8.3

WORKDIR /app
COPY ./symfony .

RUN apt update -y && apt upgrade -y
RUN apt install -y \
        git

RUN useradd symfony -m
RUN chown -R symfony:symfony .
USER symfony

RUN ./tools/composer.phar install

EXPOSE 8000
ENTRYPOINT ["./tools/symfony", "server:start"]