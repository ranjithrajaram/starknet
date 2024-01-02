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

echo "export ALCHEMY=$1" >> /root/.bash_profile

echo "Setting up environment for Starknet"
wget -O starknet.sh https://raw.githubusercontent.com/ranjithrajaram/starknet/main/starknet.sh && chmod +x starknet.sh
echo "Installing apt install libzstd-dev  before calling startknet script"
apt install libzstd-dev -y &>/dev/null
echo "calling starknet"
/bin/bash /root/starknet.sh
