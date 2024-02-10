FROM node:16

ARG DISCORD_BOT_TOKEN
ARG DEV_DISCORD_BOT_TOKEN
ARG DEV_MODE
ARG DEV_GUILD_ID
ARG STARTGG_API_URL
ARG STARTGG_TOKEN
ARG MONGODB_AUTH_URL
ARG EMBED_COLOR


ENV DISCORD_BOT_TOKEN=${DISCORD_BOT_TOKEN} \
    DEV_DISCORD_BOT_TOKEN=${DEV_DISCORD_BOT_TOKEN} \
    DEV_MODE=${DEV_MODE} \
    DEV_GUILD_ID=${DEV_GUILD_ID} \
    STARTGG_API_URL=${STARTGG_API_URL} \
    STARTGG_TOKEN=${STARTGG_TOKEN} \
    MONGODB_AUTH_URL=${MONGODB_AUTH_URL} \
    EMBED_COLOR=${EMBED_COLOR}
    
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "start"]
