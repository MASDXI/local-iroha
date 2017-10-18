#!/usr/local/bin/zsh


# closes services
# https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
docker rm $(docker ps -a -f status=exited -q)
docker ps -a | grep "postgres" | awk '{print $1}' | xargs docker kill | xargs docker rm
docker ps -a | grep "redis" | awk '{print $1}' | xargs docker kill | xargs docker rm

# services for NBC
docker run --name NBC-redis -p 6379:6379 -d redis:3.2.8
docker run --name NBC-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres:9.5
# services for ABA
docker run --name ABA-redis -p 6380:6379 -d redis:3.2.8
docker run --name ABA-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5433:5432 -d postgres:9.5
# services for ACL
docker run --name ACL-redis -p 6381:6379 -d redis:3.2.8
docker run --name ACL-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5434:5432 -d postgres:9.5
# services for FTB
docker run --name FTB-redis -p 6382:6379 -d redis:3.2.8
docker run --name FTB-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5435:5432 -d postgres:9.5
# services for CAB
docker run --name CAB-redis -p 6383:6379 -d redis:3.2.8
docker run --name CAB-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5436:5432 -d postgres:9.5

# run ctest
cd /Users/kuyseng/Blockchain/iroha/build
ctest
cd -

