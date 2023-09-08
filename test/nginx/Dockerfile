FROM alpine:3.17

RUN apk update && apk upgrade && apk --no-cache add nginx

RUN apk add php php-fpm
# COPY ./index.html /var/www/index.html

COPY ./test.php /var/www/test.php

COPY ./nginx.conf /etc/nginx/nginx.conf


COPY ./www.conf /etc/php81/php-fpm.d/www.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;"]