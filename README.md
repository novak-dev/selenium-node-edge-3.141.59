Build Docker Image for Microsoft Edge Selenium Grid 3 Node.

To run the node, the instructions are the same as what is shown in the Selenium Grid 3 documentation. For example:
```
docker network create grid 
docker run -d -p 4444:4444 --net grid --name selenium-hub selenium/hub:3.141.59-20210128 
docker run -d --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm novak2/selenium-node-edge
```

Docker repo: https://hub.docker.com/repository/docker/novak2/selenium-node-edge

