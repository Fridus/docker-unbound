# Docker Unbound
https://www.unbound.net/

## 1. Get image

```
docker pull fridus/unbound
```


## 2. Create container

```
docker run -d \
  --name="unbound" \
  -p 53:53/udp \
  -v pathConfig:/etc/unbound \
  fridus/unbound
```
