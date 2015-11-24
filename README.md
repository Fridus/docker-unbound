# Docker Unbound
https://www.unbound.net/

Quay: [![Docker Repository on Quay](https://quay.io/repository/fridus/unbound/status "Docker Repository on Quay")](https://quay.io/repository/fridus/unbound)

## 1. Get image

```
# Dockerhub
docker pull fridus/unbound
# Quay
docker pull quay.io/fridus/unbound
```


## 2. Create container

```
docker run -d \
  --name="unbound" \
  -p 53:53/udp \
  -v pathConfig:/etc/unbound \
  fridus/unbound
```
