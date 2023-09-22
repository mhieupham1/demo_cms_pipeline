- build docker

sudo apt update <br />
sudo apt install apt-transport-https ca-certificates curl software-properties-common <br />
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - <br />
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" <br />
apt-cache policy docker-ce <br />
sudo apt install docker-ce <br />

- build docker-compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose <br />
sudo chmod +x /usr/local/bin/docker-compose <br />

- build code deploy agent

https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html <br />
