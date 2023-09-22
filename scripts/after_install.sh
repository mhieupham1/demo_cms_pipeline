#!/bin/bash
echo "After install batch !"
docker-compose down
docker-compose build
docker-compose up -d
