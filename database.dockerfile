FROM mysql:latest

ENV MYSQL_DATABASE=jamendo
ENV MYSQL_ROOT_PASSWORD="pass"

COPY database/jamendo.sql /docker-entrypoint-initdb.d/dump.sql
