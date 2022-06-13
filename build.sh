#!/bin/bash

docker build -t laravel-app:latest ./app
docker build -t laravel-db:latest ./db

docker tag laravel-app:latest maxxx00m/laravel-app:latest
docker tag laravel-db:latest maxxx00m/laravel-db:latest

docker push maxxx00m/laravel-app:latest
docker push maxxx00m/laravel-db:latest