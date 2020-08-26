FROM nginx:stable

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN apt-get update \
    && apt-get install -y git

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]