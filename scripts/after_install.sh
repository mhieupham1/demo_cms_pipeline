#!/bin/bash
echo "After install batch !"
cd /var/www/
docker-compose down
docker-compose build
docker-compose up -d
