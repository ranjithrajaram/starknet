Docker installation

# Setting up repos for docker installation 2 minutes
apt-get update
apt-get install ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# Installing docker 5 minutes

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Pulling conduit 2 mins

git clone https://github.com/conduitxyz/node.git

# Setting up conduit 2 mins

cd node
./download-config.py zora-mainnet-0
export CONDUIT_NETWORK=zora-mainnet-0
echo “export CONDUIT_NETWORK=zora-mainnet-0” >> /root/.bash_profile
echo OP_NODE_L1_ETH_RPC=$1 > .env




# Bringing up docker containers
#Ignore the progress messages
#sleep 2

docker compose up --build -d
