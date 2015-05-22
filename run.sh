#!/bin/bash

docker rm -f monitor
docker rm -f haproxy
docker rm -f apache1
docker rm -f apache2

# build and run 2 apache container
docker build -t robbertvdzon/apache ./docker/apache
docker run -d -it -p 172.17.42.1:10080:80 -p 84:80 --name apache1 robbertvdzon/apache
docker run -d -it -p 172.17.42.1:20080:80 -p 85:80 --name apache2 robbertvdzon/apache

# build and run haproxy container
docker build -t robbertvdzon/haproxy ./docker/haproxy
docker run -d -it -p 80:80 -p 81:81 --name haproxy robbertvdzon/haproxy


# build and run wildfly container
docker build -t robbertvdzon/monitor ./docker/monitor
docker run -d -it -p 1287:8787 -p 1290:9990 -p 172.17.42.1:38080:8080 -p 82:8080 --name monitor --link haproxy:haproxy robbertvdzon/monitor


