## `su` to root and:
```
SERVER_USER=server3d &&
apt-get update -y && apt-get upgrade -y &&
apt-get install -y \
sudo \
htop \
apt-transport-https \
git \
ca-certificates \
curl \
gnupg2 \
software-properties-common \
python3-serial &&
curl -sSL https://get.docker.com | sh &&
apt-get install -y docker-compose &&
sudo adduser $SERVER_USER sudo && su $SERVER_USER && cd
```
## Checking for printers and web cameras:
python3 -m serial.tools.miniterm