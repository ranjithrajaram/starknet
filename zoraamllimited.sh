
#1/bin/bash

echo "Setting up Starknet on VPS and integrating with Alchemy"
echo "*******************************************************"

echo "Prerequisites: Login to alchemy"
echo "Create a new APP on Alchemy" 
echo " Name: Startknet VPS number "
echo " Network: Ethereum Mainnet "
echo " After creating the app, click view key and copy the HTTPS key to connect to Alchemy "
echo " This key should be passed as an argument while running the script"

echo "*********************************"       

echo "To run the script /bin/bash starknet.sh <httpskey> \n

      example
      /bin/bash starknet.sh https://eth-mainnet.g.alchemy.com/v2/SbhPixV3FQJubLT2e59XXXXXXXXXX"

echo "******************************"
echo
echo

if [ "$#" -eq 0 ]
then
  echo "No arguments supplied, rerun the sript and refer the example above"
  exit 1
fi

echo "Docker installation"
echo "Setting up repos"
# Setting up repos for docker installation 2 minutes
apt-get update  1>/dev/null  2>&1
apt-get install ca-certificates curl gnupg git  1>/dev/null  2>&1
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update 1>/dev/null  2>&1

echo "Installing docker 5 minutes"
 apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y 1>/dev/null  2>&1

echo " Pulling conduit 2 mins"
git clone https://github.com/conduitxyz/node.git
echo " Setting up conduit 2 mins"
cd node
./download-config.py zora-mainnet-0
export CONDUIT_NETWORK=zora-mainnet-0
echo “export CONDUIT_NETWORK=zora-mainnet-0” >> /root/.bash_profile
echo OP_NODE_L1_ETH_RPC=$1 > .env

echo " Bringing up docker containers"
echo "sleep 2"

docker compose up --build -d
