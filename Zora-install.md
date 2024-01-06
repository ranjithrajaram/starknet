
## Step1

Download the first script to the VPS server

~~~
wget -O zoraamllimited.sh https://raw.githubusercontent.com/ranjithrajaram/starknet/main/zoraamllimited.sh && chmod +x zoraamllimited.sh
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

./zoraamllimited.sh  "Copy-paste-HTTPS-Key from Alchemy"

Example
~~~
./zoraamllimited.sh  https://eth-mainnet.g.alchemy.com/v2/SbhPixV3FQJubLT2e59XXXXXXXXXX"
~~~
