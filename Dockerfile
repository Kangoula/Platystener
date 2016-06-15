FROM php:5.6-apache 
MAINTAINER Guillaume DENIS <denisgme@gmail.com>

RUN apt-get update && apt-get install -y php5-mysql &&\ 
     docker-php-ext-install pdo pdo_mysql 

