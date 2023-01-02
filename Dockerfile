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
  git &&\
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm i -g npm

RUN npm install

RUN npm i -g pm2 && npm i pm2 -g

COPY . .

EXPOSE 5000

CMD ["pm2-runtime", "next.js"]`
