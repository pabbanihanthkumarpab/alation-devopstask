#!/bin/bash

docker rm -f nginx-container webserver1 webserver2
docker network rm sample-app
