FROM node:18.8-alpine as base

FROM base as builder

WORKDIR /home/node/app
COPY package*.json ./

COPY . .
RUN yarn install
RUN yarn build

FROM base as runtime


ENV NODE_ENV=production
ENV PAYLOAD_CONFIG_PATH=dist/payload.config.js
ENV GCS_BUCKET=my-test-bucket-2002
ENV GCS_PROJECT_ID=payloadcms-test

WORKDIR /home/node/app
COPY package*.json  ./

COPY key.json ./key.json
ENV GOOGLE_APPLICATION_CREDENTIALS=./key.json

RUN yarn install --production
COPY --from=builder /home/node/app/dist ./dist
COPY --from=builder /home/node/app/build ./build

EXPOSE 3000

CMD ["node", "dist/server.js"]
