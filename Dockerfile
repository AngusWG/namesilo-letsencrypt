FROM python:3.12.0-alpine3.18

RUN apk add certbot certbot-nginx nginx supercronic && \
    pip install tldextract untangle

COPY ./cronjob /usr/local/etc/cronjob

WORKDIR /app
COPY . ./
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/bin/sh","/app/entrypoint.sh"]
CMD sh
