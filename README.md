First your need to edit `<YOUR_PATH>` in `config.json`,`run_clear_block.sh` and `run_clear_nodes.sh` in every node directory

In config.json file
``` json
{
  "block_store_path" : "<YOUR_PATH>/Blockchain/iroha/singe-pc/block_store/",
  "torii_port" : 50550,
  "pg_opt" : "host=localhost port=5432 user=postgres password=mysecretpassword",
  "redis_host" : "localhost",
  "redis_port" : 6379
}
```

``` bash
# docker redis and postgres
$ ./run_init.sh
```

``` bash
# repeat in every node directory
$ cd Node-n
$ ./run_noden.sh
```

