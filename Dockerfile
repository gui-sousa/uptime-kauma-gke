FROM alpine:latest

RUN apk add git && \
apk add --update nodejs && \
apk add --update npm && \
git clone https://github.com/louislam/uptime-kuma.git

WORKDIR /uptime-kuma

ADD https://github.com/gui-sousa/uptime-kauma-gke/raw/dev/data.tar.gz ./
#RUN tar -xvf data.tar.gz 

RUN tar -xvf data.tar.gz && \ 
npm run setup && \
npm install pm2 -g && pm2 install pm2-logrotate && \
rm -rf /root/.cache && \
rm -rf data.tar.gz

CMD ["node", "server/server.js"]

EXPOSE 3001