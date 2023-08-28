# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aaammari <aaammari@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/25 09:48:51 by aaammari          #+#    #+#              #
#    Updated: 2023/08/28 09:26:45 by aaammari         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

RUN apk update && apk add mariadb mariadb-client openrc

# RUN mkdir -p /var/lib/mysql

COPY tool/50-server.cnf /etc/my.cnf.d/50-server.cnf

COPY tool/mariaDb.sh /mariaDb.sh

# COPY tool/test.sh /test.sh


EXPOSE 3306

CMD ["/bin/sh", "/mariaDb.sh"]
