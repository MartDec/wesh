FROM ubuntu:18.04

ARG PORT=80

EXPOSE 80/tcp
EXPOSE 80/udp

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
&& echo "nameserver 8.8.4.4" >> /etc/resolv.conf

RUN rm -f /etc/localtime \
&& ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

RUN apt update && apt upgrade -y
RUN apt install -y git vim curl wget software-properties-common mysql-server unzip tar

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install -y nodejs

WORKDIR /var/www/node-blog
