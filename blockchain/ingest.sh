sudo apt-add-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y bitcoind jq
bitcoind -dbcache=4096 -daemon
# This requires 4GB of ram, for faster sync
# Wait several hours for the blockchain to be downloaded and verified
# You can check the progress with:
bitcoin-cli getblockchaininfo | jq -r '.verificationprogress'

# Once download and verification are complete
hdfs dfs -mkdir -p /user/cloudera/bitcoin/input
hdfs dfs -put ~./.bitcoin/blocks/blk*.dat /user/cloudera/bitcoin/input
rm -fr ~./.bitcoin
