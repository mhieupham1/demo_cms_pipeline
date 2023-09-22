#!/bin/bash
echo "After install batch !"
cd /var/www/
sudo docker-compose down
sudo docker-compose build
sudo docker-compose up -d
