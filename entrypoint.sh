#!/bin/sh

if [ -z "$(ls -A /etc/letsencrypt)" ]; then
    # /etc/letsencrypt folder is empty, indicating first run
    /bin/sh /app/namesilo-certbot.sh
fi

supercronic /usr/local/etc/cronjob
