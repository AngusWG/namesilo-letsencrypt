FROM python:3.12.0-alpine3.18

RUN apk add certbot certbot-nginx nginx && \
    pip install tldextract untangle

WORKDIR /app
COPY ./namesilo-letsencrypt-0.9.2/ ./
COPY ./namesilo-certbot.sh ./

RUN crontab -l > mycron && \
    echo "0 12 * * * /usr/bin/certbot renew --quiet" >> mycron && \
    crontab mycron && \
    rm mycron

CMD sh
