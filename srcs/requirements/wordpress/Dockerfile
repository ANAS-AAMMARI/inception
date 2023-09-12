# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aaammari <aaammari@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/05 11:02:27 by aaammari          #+#    #+#              #
#    Updated: 2023/09/11 16:22:16 by aaammari         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

RUN apk update && apk upgrade && apk add php php-fpm \
    php-mysqli mariadb-client

RUN mkdir -p /var/www

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm -rf latest.tar.gz && \
    mv wordpress /var/www/wordpress

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf

#Create the folder to enable php start
RUN mkdir  /run/php

COPY ./tools/script.sh /usr/lcoal/bin/script.sh
ENTRYPOINT ["/bin/sh", "/usr/lcoal/bin/script.sh"]

EXPOSE 9000

RUN chown -R root:root /var/www/wordpress

CMD ["php-fpm81", "-F"]