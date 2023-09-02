# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aaammari <aaammari@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/25 09:48:51 by aaammari          #+#    #+#              #
#    Updated: 2023/09/02 17:01:59 by aaammari         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

RUN apk update && apk add mariadb mariadb-client openrc

# RUN mkdir -p /var/lib/mysql

COPY tool/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY tool/mariaDb.sh /mariaDb.sh
# COPY tool/test.sh /test.sh

EXPOSE 3306

CMD ["/bin/sh", "/mariaDb.sh"]
# CMD ["/bin/sh", "/test.sh"]
