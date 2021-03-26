# node-chromium Docker Image

Docker image with [Node.js](https://nodejs.org/) and [Chromium](https://www.chromium.org/Home) for tests 
(with headless handling).

## Version
Latest version: 0.1

## Build local

```
docker build -t lennetech/node-chromium:latest .
```

## Usage

`Dockerfile`:
```dockerfile

# Use docker image
FROM lennetech/node-chromium

# Go to work directory
WORKDIR /usr/src/app

# Install 
COPY ["path/to/app/root-dir/package*.json", "./"]
RUN npm ci

# Test and build app
COPY ["path/to/app/root-dir/", "./"]
RUN npm run test:headless
RUN npm run build
```

`docker-compose.yml`:
```yaml
version: "3.7"

services:
  frontend:
    build: .
```

## Push to Docker Hub

Install docker:
[https://docs.docker.com/get-started/#download-and-install-docker-desktop](https://docs.docker.com/get-started/#download-and-install-docker-desktop)

```
docker build -t lennetech/node-chromium:latest .
docker login --username=lennetech --password=PASSWORD
docker push lennetech/node-chromium:latest
```

## Sources

### Documentation
- [Orientation and setup](https://docs.docker.com/get-started/)
- [Build and run your image](https://docs.docker.com/get-started/part2/)
- [Share images on Docker Hub](https://docs.docker.com/get-started/part3/)

### Reference
- [Dockerfile](https://docs.docker.com/engine/reference/builder/)
- [docker_login](https://docs.docker.com/engine/reference/commandline/login/)
- [docker build](https://docs.docker.com/engine/reference/commandline/build/)
- [docker push](https://docs.docker.com/engine/reference/commandline/push/)
