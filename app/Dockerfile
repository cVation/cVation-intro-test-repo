FROM node:20-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
RUN sleep 600
CMD ["node", "/app/src/index.js"]