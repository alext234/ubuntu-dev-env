
## Docker image
This repository maintains the Dockerfile for a Ubuntu based environment. The docker image is published via Github Actions at:


```
docker.pkg.github.com/alext234/ubuntu-dev-env/dev-env:latest
```


## What's inside the buit docker image

* vscode (accessible via browser at port `8080`)
* flutter 
* python3


Volume persistence:

* `/home/code/flutter` 



## Run with `docker-compose`


Here is a sample 


[docker-compose.yml](docker-compose.yml) 
