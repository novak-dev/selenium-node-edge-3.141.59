Build Docker Image for Microsoft Edge Selenium Grid 3 Node.

To run the node, you will need to provide the Hub IP:
`
docker run -d -e HUB_HOST=localhost -v /dev/shm:/dev/shm novak2/selenium-node-edge
`

Docker repo: https://hub.docker.com/repository/docker/novak2/selenium-node-edge

