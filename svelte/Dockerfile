FROM node:22.11.0 AS build

WORKDIR /app
COPY . .

EXPOSE 5173
ENTRYPOINT ["sh", "-c", "npm install && npm run dev"]