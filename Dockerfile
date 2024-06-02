FROM ghcr.io/puppeteer/puppeteer:22.7.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /usr/

COPY package*.json ./

USER root

RUN npm ci --unsafe-perm

USER pptruser

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
