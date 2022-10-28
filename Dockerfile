FROM louislam/uptime-kuma:latest

ADD https://github.com/gui-sousa/uptime-kauma-gke/raw/dev/data.tar.gz ./

RUN tar -xzf data.tar.gz -C /app/data

EXPOSE 3001











#FROM alpine:latest
#RUN apk add --no-cache bash && \
#apk add git && \
#apk add --update nodejs && \
#apk add --update npm && \
#git clone https://github.com/louislam/uptime-kuma.git 
#WORKDIR /uptime-kuma
#RUN npm run setup && \
#npm install pm2 -g && pm2 install pm2-logrotate && \
#pm2 start server/server.js --name uptime-kuma
#CMD tail -f /dev/null
#EXPOSE 3001