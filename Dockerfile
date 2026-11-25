FROM node:24-trixie-slim

RUN apt-get update && apt-get install -y \
    ffmpeg git ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

ENV COMMAND=!a
ENV MAX_PARALLEL_JOBS=1
ENV SAVE_OUTPUTS=0
ENV SESSION_DIR=/app/whatsapp_session

CMD ["npm", "start"]
