#!/bin/bash
set -e

if [ "$1" = 'nginx' ]; then

    echo "upstream php-upstream { server $UPSTREAM:9000; }" > /etc/nginx/conf.d/upstream.conf

    if [ "$APPFILE" ]; then
       sed -i -e "s/APPFILE/$APPFILE/g" /etc/nginx/conf.d/symfony.conf
    fi

    if [ "$URL" ]; then
       sed -i -e "s/URL/$URL/g" /etc/nginx/conf.d/symfony.conf
    fi

    if [ "$ROOTPATH" ]; then
       sed -i -e "s/ROOTPATH/$ROOTPATH/g" /etc/nginx/conf.d/symfony.conf
    fi

fi

exec "$@"
