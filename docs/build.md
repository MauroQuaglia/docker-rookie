```
docker buildx create --name builder-with-docker-container --driver=docker-container
docker buildx ls

docker buildx use builder-with-docker-container
cd /images/multi_platform
docker buildx build --platform linux/arm64 -t arm64:latest --load .
OK: perché con questo driver riesce a fare anche arm

docker buildx use default
cd /images/multi_platform
docker buildx build --platform linux/arm64 -t arm64:latest --load .
KO: perché con questo driver non riesce a fare anche arm
```