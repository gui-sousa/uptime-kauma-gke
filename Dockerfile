FROM alpine:latest

RUN apk add git && \
apk add --update nodejs && \
apk add --update npm && \
git clone https://github.com/louislam/uptime-kuma.git

WORKDIR /uptime-kuma

ADD https://github.com/gui-sousa/uptime-kauma-gke/raw/dev/dist.tar.gz ./
ADD https://github.com/gui-sousa/uptime-kauma-gke/raw/dev/public.tar.gz ./
COPY index.html .
#RUN tar -xvf public.tar.gz 

RUN tar -xvf public.tar.gz && \ 
npm run setup && \
npm install pm2 -g && pm2 install pm2-logrotate && \
tar -xvf dist.tar.gz && \
rm -rf /root/.cache && \
rm -rf public.tar.gz

CMD ["node", "server/server.js"]

EXPOSE 3001