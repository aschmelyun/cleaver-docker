#!/bin/bash

cd /var/www/html

pwd

ls -la

if [[ ! -f /var/www/html/cleaver ]]
then
    git clone https://github.com/aschmelyun/cleaver.git /var/www/html && rm -r .git
fi

exec "$@"