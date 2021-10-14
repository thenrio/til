At start, daemon reads container restart policy and MAY start it.

> [Start container automatically](https://docs.docker.com/config/containers/start-containers-automatically/)

This can be changed.

```sh
docker update --restart=no hasura_postgres_1
```

```sh
$ docker inspect hasura_graphql-engine_1 --format='{{.HostConfig.RestartPolicy}}'
{no 0}
$ docker inspect hasura_graphql-engine_1 | jq .[].HostConfig.RestartPolicy
{
  "Name": "no",
  "MaximumRetryCount": 0
}
```
