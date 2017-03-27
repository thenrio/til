```bash
docker rmi $(docker images --quiet --filter=dangling=true)
```
