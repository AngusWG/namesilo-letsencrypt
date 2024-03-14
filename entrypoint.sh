#!/bin/sh

if [ -z "$(ls -A /etc/letsencrypt)" ]; then
    # /etc/letsencrypt folder is empty, indicating first run
    /bin/sh /app/namesilo-certbot.sh
else
    echo "/etc/letsencrypt folder exists."
fi

echo "supercronic /usr/local/etc/cronjob"
supercronic /usr/local/etc/cronjob
