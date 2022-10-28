FROM alpine:latest

RUN apk add --no-cache bash && \
apk add git && \
apk add --update nodejs && \
apk add --update npm && \
git clone https://github.com/louislam/uptime-kuma.git 

WORKDIR /uptime-kuma
RUN npm run setup && \
npm install pm2 -g && pm2 install pm2-logrotate && \
pm2 start server/server.js --name uptime-kuma

CMD tail -f /dev/null


EXPOSE 3001