#!/bin/bash

docker build -t jarvis99/mongo-db -f Dockerfile_mongodb .

cd client/

docker build -t jarvis99/react-ui -f Dockerfile_react-ui .

cd ..

cd server/

docker build -t jarvis99/node-app -f Dockerfile_node-app .

cd ..

docker network create my-mern-network

docker run -d --network my-mern-network -p 27017:27017 --name mongo-db jarvis99/mongo-db

docker run -d --network my-mern-network -p 3000:3000 --name react-ui jarvis99/react-ui

docker run -d --network my-mern-network -p 5000:5000 --name node-app jarvis99/node-app

