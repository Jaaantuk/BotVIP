FROM node:16.10.0-buster

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  chromium \
  ffmpeg \
  wget \
  imagemagick \
  graphicsmagick \
  webp \
  mc && \
  nodejs \
  python \
  python2 \
  bash \
  git \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm i -g npm

RUN npm install

COPY . .

EXPOSE 5000

RUN pm2 save

CMD ["pm2-runtime", "next.js"]`
