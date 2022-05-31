FROM alpine:edge

ARG AUUID="9527"
ARG CADDYIndexPage="https://github.com/AYJCSGM/mikutap/archive/master.zip"
ARG ParameterSSENCYPT="aes-128-gcm"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    wget -N https://github.com/Misaka-blog/KOXray/raw/master/deploy.sh && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
