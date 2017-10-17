#!/usr/local/bin/zsh


# closes services
# https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
docker rm $(docker ps -a -f status=exited -q)
docker ps -a | grep "postgres" | awk '{print $1}' | xargs docker kill | xargs docker rm
docker ps -a | grep "redis" | awk '{print $1}' | xargs docker kill | xargs docker rm

# services for NBC
docker run --name nbc-redis -p 6379:6379 -d redis:3.2.8
docker run --name nbc-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres:9.5
# services for ABA
docker run --name aba-redis -p 6380:6379 -d redis:3.2.8
docker run --name aba-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5433:5432 -d postgres:9.5
# services for ACL
docker run --name acl-redis -p 6381:6379 -d redis:3.2.8
docker run --name acl-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5434:5432 -d postgres:9.5

# run ctest
cd /Users/kuyseng/Blockchain/iroha/build
ctest
cd -

