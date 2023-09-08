# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aaammari <aaammari@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/05 11:02:27 by aaammari          #+#    #+#              #
#    Updated: 2023/09/06 14:55:06 by aaammari         ###   ########.fr        #
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

RUN chown -R root:root /var/www/wordpress