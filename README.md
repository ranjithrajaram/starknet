
## Step1

Download the first script to the VPS server

~~~
wget -O starknetaml.sh https://raw.githubusercontent.com/ranjithrajaram/starknet/main/starknet-amllimited.sh && chmod +x starknetaml.sh
~~~

## Step2

Create the API Key on Alchemy Portal

1\. Create a new APP on Alchemy" 
2\. Name: Startknet VPS number "
3\.  Network: Ethereum Mainnet "
4\.  After creating the app, click view key and copy the HTTPS key to connect to Alchemy "

"This key should be passed as an argument while running the script"

## Step3

Run the Script using the command

./starknetaml.sh  <HTTPS-Key>

Example
~~~
./starknetaml.sh https://eth-mainnet.g.alchemy.com/v2/SbhPixV3FQJubLT2e59XXXXXXXXXX"
~~~
