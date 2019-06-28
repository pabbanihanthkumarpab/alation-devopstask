#!/bin/bash

workspace="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
network="sample-app"

#creating docker network
docker network create ${network}

imageName="node:7"
network="sample-app"
container_total_count=2
webserverlist_file="${workspace}/webservers.list"

#delete existing webserverlist file
rm -f ${webserverlist_file} || true

#spining up webserver containers ...
for container_counter in `seq 1 $container_total_count`
do
        docker run --network ${network} --name webserver${container_counter} \
        --hostname webserver${container_counter} \
        -v ${workspace}/app.js:/app.js -d ${imageName} bash -c "node app.js"
        echo "server webserver${container_counter}:8080;" >> ${workspace}/webservers.list
done


#start nginx
docker run --network ${network} --name nginx-container --hostname nginx \
-v ${workspace}/nginx.conf:/etc/nginx/nginx.conf \
-v ${workspace}/webservers.list:/etc/nginx/webservers.list \
-p 80:80 \
-d nginx
