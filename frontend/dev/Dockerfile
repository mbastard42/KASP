FROM node:latest

WORKDIR /app
COPY ./svelte .
RUN npm install

ENTRYPOINT ["npm", "run", "dev"]