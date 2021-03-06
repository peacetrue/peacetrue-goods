#!/bin/bash

env=${1}
if [ -n "$env" ]; then
  echo "0. set MICROSERVICE_ENV=$env"
  export "MICROSERVICE_ENV=$env"
else
  echo "0. use default MICROSERVICE_ENV=$MICROSERVICE_ENV"
fi

echo "1. gradle bootJar"
./gradlew clear
./gradlew bootJar

cd peacetrue-goods-docker || exit

echo "2. docker-compose down"
docker-compose down

echo "3. docker-compose up --build -d"
docker-compose up --build -d
