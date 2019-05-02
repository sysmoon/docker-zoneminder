#!/bin/bash

# create docker network name by net
docker network create net

# run db
docker run -d -e TZ=Asia/Seoul -e MYSQL_USER=zmuser -e MYSQL_PASSWORD=zmpass -e MYSQL_DATABASE=zm -e MYSQL_ROOT_PASSWORD=mysqlpsswd -e MYSQL_ROOT_HOST=% --net net --name db mysql/mysql-server:5.7

echo "wait until MySQL startup..."
# run zoneminder
docker run -d --shm-size=4096m -e TZ=Asia/Seoul -e ZM_DB_HOST=db --net net --name zm -p 8090:80 quantumobject/docker-zoneminder

# access browser and click accept & apply
http://youtip:8090/zm


