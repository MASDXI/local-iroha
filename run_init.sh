#!/usr/local/bin/zsh


# closes services
# https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
docker rm $(docker ps -a -f status=exited -q)
docker ps -a | grep "postgres" | awk '{print $1}' | xargs docker kill | xargs docker rm
docker ps -a | grep "redis" | awk '{print $1}' | xargs docker kill | xargs docker rm

# services for Node-0
docker run --name Node-0-redis -p 6379:6379 -d redis:3.2.8
docker run --name Node-0-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres:9.5
# services for Node-1
docker run --name Node-1-redis -p 6380:6379 -d redis:3.2.8
docker run --name Node-1-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5433:5432 -d postgres:9.5
# services for Node-2
docker run --name Node-2-redis -p 6381:6379 -d redis:3.2.8
docker run --name Node-2-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5434:5432 -d postgres:9.5
# services for Node-4
docker run --name Node-4-redis -p 6382:6379 -d redis:3.2.8
docker run --name Node-4-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5435:5432 -d postgres:9.5
# services for Node-3
docker run --name Node-3-redis -p 6383:6379 -d redis:3.2.8
docker run --name Node-3-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5436:5432 -d postgres:9.5

# run ctest
cd <YOUR_PATH>/Blockchain/iroha/build
ctest
cd -

