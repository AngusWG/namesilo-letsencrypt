FROM python:3.12.0-alpine3.18

RUN apk add certbot certbot-nginx nginx supercronic && \
    pip install tldextract untangle

COPY ./cronjob /usr/local/etc/cronjob
COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /app
COPY ./namesilo-letsencrypt-0.9.2/ ./
COPY ./namesilo-certbot.sh ./

ENTRYPOINT ["/entrypoint.sh"]
CMD sh
