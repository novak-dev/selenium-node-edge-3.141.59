# Run the container, requires setting up Docker network 'grid'
docker run -d -e HUB_HOST -v /dev/shm:/dev/shm --net grid  --name selenium-node-edge selenium-node-edge
