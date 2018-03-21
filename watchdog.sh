overclocking(){
  if ($`hostname`OverclockingOverride == 1) then
    echo ""
	echo "Overclocking Override !"
	echo ""
    overclocking_override
  else
    echo ""
	echo "Overclocking !"
	echo ""
  
    overclocking
  fi

}


watchdog () { 
	if (pgrep "ethdcrminer64" >/dev/null 2>&1;) then

	 if tail -n16 /home/cryptek/claymore/log.txt | grep -io "cuda error\|error cuda" >/dev/null 2>&1;  then

			tail -n64 /home/cryptek/claymore/log.txt > "/tmp/watchdog_error_$(date)"

			# Kill all instances of ethminer
			killall "ethdcrminer64"
			ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
			echo "$(date) Miner requires restart due to error"
			# Send mail
			echo "$(date) Miner requires restart due to errori (cuda error)" | mail -s "$(hostname) Miner WatchDog Restart" semias@gmail.com,toan.nguyen.doan@gmail.com

			# Restart mining rig
			/sbin/shutdown 2 -f -r

			# Abandon WatchDog
			exit

	  fi
	 if tail -n16 /home/cryptek/claymore/log.txt | grep -io "error 15" >/dev/null 2>&1;  then

			tail -n64 /home/cryptek/claymore/log.txt > "/tmp/watchdog_error_$(date)"

			# Kill all instances of ethminer
			killall "ethdcrminer64"
			ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
			echo "$(date) Miner requires restart due to error : NVML: cannot get current temperature, error 15"
			# Send mail
			echo "$(date) Miner requires restart due to error  : NVML: cannot get current temperature, error 15" | mail -s "$(hostname) Miner WatchDog Restart" semias@gmail.com,toan.nguyen.doan@gmail.com

			# Restart mining rig
			/sbin/shutdown 2 -f -r

			# Abandon WatchDog
			exit

	  fi
	#NVML: cannot get current temperature, error 15

	  if nvidia-smi | grep -io "/ 100W" >/dev/null 2>&1; then
			echo "$(date) Overclocking is correctly applied"
		else
		 echo "$(date) Overclocking is not set, overclock!"
		 sh /home/cryptek/overclocking.sh
		 if nvidia-smi | grep "Reboot the system to recover this GPU" >/dev/null 2>&1; then
			echo "$(date) GPU is locked, Nvidia-SMI is not able to apply overclocking, RIG is going to reboot."
			echo "$(date) GPU is locked, Nvidia-SMI is not able to apply overclocking, RIG is going to reboot." | mail -s "$(hostname) Miner WatchDog Restart" semias@gmail.com,toan.nguyen.doan@gmail.com
			tail -n64 /home/cryptek/claymore/log.txt > "/tmp/watchdog_error_$(date)"

			# Kill all instances of ethminer
			killall "ethdcrminer64"
			ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
			# Restart mining rig
			/sbin/shutdown 2 -f -r
			exit
		 fi
	   fi


	  if nvidia-smi -L | grep -io "GPU 5" >/dev/null 2>&1; then

		echo "Miner already running."
	  else
		tail -n64 /home/cryptek/claymore/log.txt > "/tmp/watchdog_error_$(date)"

		ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
		echo "$(date) One GPU Missing!!! Miner requires restart "
		echo "$(date) One GPU Missing!!! Miner requires restart " | mail -s "$(hostname) Miner WatchDog Restart" semias@gmail.com,toan.nguyen.doan@gmail.com
		killall "ethdcrminer64"
		# Restart mining rig
		/sbin/shutdown 2 -f -r
	  fi
	else
	  echo "$(date) Miner was not started. Starting Miner!"
	#    if nvidia-smi -q | grep "75 %" >/dev/null 2>&1; then
	  ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill  >/dev/null 2>&1

	  screen -mdS Mining bash -c 'cd /home/cryptek/claymore/;/home/cryptek/claymore/mine.sh; exec bash'

	#   else
	 #       echo "Fans are down! Fuck!"
	#    fi
	fi 
}