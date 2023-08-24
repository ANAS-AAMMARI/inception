FROM alpine:3.17.5

RUN apk update && apk add mariadb mariadb-server


# FROM debian:buster

# RUN apt-get update && apt-get install -y mariadb-server

# COPY tool/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY tool/mariaDb.sh /mariaDb.sh

# RUN chmod +x /mariaDb.sh

# EXPOSE 3306

# CMD ["/mariaDb.sh"]