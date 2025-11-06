FROM node:18-alpine

RUN apk add --no-cache aws-cli python3

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 5173

ENTRYPOINT ["sh", "startup.sh"]