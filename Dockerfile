FROM alpine:latest

RUN apk add --no-cache bash && \
apk add git && \
apk add --update nodejs && \
apk add --update npm && \
git clone https://github.com/louislam/uptime-kuma.git 

WORKDIR /uptime-kuma
CMD ["/bin/sh"]

EXPOSE 3001
#,"npm install pm2 -g && pm2 install pm2-logrotate"]





#FROM louislam/uptime-kuma:latest

#VOLUME [ "app/data" ]
#EXPOSE 3001