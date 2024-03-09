#!bin/sh
git clone -b release https://github.com/TheSpaghettiDetective/obico-server.git &&
cd obico-server && sudo docker compose up -d && cd .. &&
cd octoprint && sudo docker compose up -d && cd ..