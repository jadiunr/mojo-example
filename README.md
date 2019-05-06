# mojo-example
Sample application.

## Getting started

```
docker-compose build
# If your host UID isn't 1000
# docker-compose build --build-args uid=<Your host UID (Default 1000)>

docker-compose run --rm app carton install
docker-compose up -d
```
