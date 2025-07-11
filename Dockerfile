FROM node:20-alpine

WORKDIR /app

COPY package* .

RUN npm install

COPY . .

RUN npx prisma generate

RUN npm run build

# we can expose port for readability
EXPOSE 3000

CMD [ "npm", "run" , "dev:docker"]