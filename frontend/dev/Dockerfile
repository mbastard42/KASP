FROM node:latest

WORKDIR /app
COPY ./svelte .

EXPOSE 5173
ENTRYPOINT ["sh", "-c", "npm install && npm run dev"]