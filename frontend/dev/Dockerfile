FROM node:latest

WORKDIR /app
COPY ./svelte .

RUN npm install

EXPOSE 5173
ENTRYPOINT ["npm", "run", "dev"]