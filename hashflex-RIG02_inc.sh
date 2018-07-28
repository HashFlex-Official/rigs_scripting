if [ ! -d "/home/cryptek/claymore/newVersion" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
	cd /home/cryptek/claymore/
	wget https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v11.8/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD.NVIDIA.GPU.Miner.v11.8.-.LINUX.tar.gz
	tar -zxvf ./Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD.NVIDIA.GPU.Miner.v11.8.-.LINUX.tar.gz
	mv "./Claymore's Dual Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak AMD+NVIDIA GPU Miner v11.8 - LINUX/" ./newVersion
	rm ./newVersion/dpools.txt
    rm ./newVersion/epools.txt
	ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
    rm ./mine.sh
	
	echo "find /home/cryptek/claymore -name *log.txt -mtime +10 -exec rm {} \;" > $claymoreRunScript
	echo " " >> $claymoreRunScript
	echo " ./newVersion/ethdcrminer64 -epool eth-eu1.nanopool.org:9999 -ewal 0x6b5C7a5316107b7Ac52034b0Ddd3145e2FbFe7d8/hashflex02/cryptekrigs@gmail.com -ttli 79 -wd 1 -gser 1 -etha 0 -r 120 -tt -90 -li $livalue -logfile /home/cryptek/claymore/log.txt " >> $claymoreRunScript
fi






if [ ! -e /home/cryptek/claymore/$scriptVersion ]; then

	rm ./mince.sh
	echo "find /home/cryptek/claymore -name *log.txt -mtime +10 -exec rm {} \;" > $claymoreRunScript
	echo " " >> $claymoreRunScript
	echo " ./newVersion/ethdcrminer64 -epool eth-eu1.nanopool.org:9999 -ewal 0x6b5C7a5316107b7Ac52034b0Ddd3145e2FbFe7d8/hashflex02/cryptekrigs@gmail.com -ttli 79 -wd 1 -gser 1 -etha 0 -r 120 -tt -90 -li $livalue -logfile /home/cryptek/claymore/log.txt " >> $claymoreRunScript
	chmod +x $claymoreRunScript
	ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
	echo "$(date) Miner script upgrade: $messageScriptUpgrade " | mail -s "$(hostname) Miner script upgrade: $messageScriptUpgrade" semias@gmail.com,toan.nguyen.doan@gmail.com
fi



