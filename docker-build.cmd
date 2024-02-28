@echo off
docker-compose down && ^
docker build -t language-base ./language-base && ^
docker build -t hadoop-base ./hadoopbase && ^
docker build -t hadoop-namenode ./namenode && ^
docker build -t hadoop-datanode ./datanode && ^
docker build -t resourcemanager ./resourcemanager && ^
docker-compose up -d
