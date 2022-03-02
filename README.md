Build Docker Image for Selenium 3.141.59 Microsoft Edge Node. Official selenium docker repo only supports Grid 4.

It is recommended to build the image locally and run a container from it, for example:
```
docker network create grid 
docker run -d -p 4444:4444 --net grid --name selenium-hub selenium/hub:3.141.59-20210128 
docker run -d -e HUB_HOST -v /dev/shm:/dev/shm --net grid  --name selenium-node-edge selenium-node-edge
docker build . --tag "selenium-node-edge"
run.sh

```
Instead of building locally, you can access image from Docker repo (may be out of date): https://hub.docker.com/repository/docker/novak2/selenium-node-edge
Use this command instead of run.sh

```docker run -d --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm novak2/selenium-node-edge```
