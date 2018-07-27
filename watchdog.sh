

startOverclocking(){
  overclocking
}

getSystemType(){
        if lspci -vnn | grep VGA -A 12 | grep -io "Radeon" >/dev/null 2>&1; then
          export systemType="Radeon"
          if lspci -vnn | grep VGA -A 12 | grep -io "NVIDIA" >/dev/null 2>&1; then
                export systemType="Hybrid System"
          fi


          else if  lspci -vnn | grep VGA -A 12 | grep -io "NVIDIA" >/dev/null 2>&1; then
                export systemType="Nvidia"
          else
                export systemType="Unknown System"
          fi
        fi
}
getSystemType


watchdog () { 


 if [ "$OverclockingOverrideEnabled" = "1" ]; then
    echo ""
	echo "Overclocking Override Detected !"
	echo "" 	
	export voltageLimit=$voltageLimitOverride
	export memoryGPU1=$memoryGPU1Override
	export clockGPU1=$clockGPU1Override
	export memoryGPU2=$memoryGPU2Override
	export clockGPU2=$clockGPU2Override
	export memoryGPU3=$memoryGPU3Override
	export clockGPU3=$clockGPU3Override
	export memoryGPU4=$memoryGPU4Override
	export clockGPU4=$clockGPU4Override
	export memoryGPU5=$memoryGPU5Override
	export clockGPU5=$clockGPU5Override
	export memoryGPU6=$memoryGPU6Override
	export clockGPU6=$clockGPU6Override
  else
    echo ""
	echo ""
  fi
  
  
	if (pgrep "ethdcrminer64" >/dev/null 2>&1;) then

	 if tail -n128 $claymoreLogFile | grep -io "Set global fail flag" >/dev/null 2>&1;  then

			tail -n64 $claymoreLogFile > "/tmp/watchdog_error_$(date)"

			# Kill all instances of ethminer
			killall "ethdcrminer64"
			ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
			echo "$(date) Miner requires restart due to error (Set global fail flag)"
			# Send mail
			echo "$(date) Miner requires restart due to errori (Set global fail flag)" | mail -s "$(hostname) Miner WatchDog Restart" semias@gmail.com,toan.nguyen.doan@gmail.com

			# Restart mining rig
			/sbin/shutdown 2 -f -r

			# Abandon WatchDog
			exit

	  fi
	  
	 if tail -n16 $claymoreLogFile | grep -io "cuda error\|error cuda" >/dev/null 2>&1;  then

			tail -n64 $claymoreLogFile > "/tmp/watchdog_error_$(date)"

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
	  
	  
	 if tail -n16 $claymoreLogFile | grep -io "error 15" >/dev/null 2>&1;  then

			tail -n64 $claymoreLogFile > "/tmp/watchdog_error_$(date)"

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
	  
	if [ "$systemType" = "Nvidia" ]; then
		#fix to Invalid MIT-MAGIC-COOKIE-1 When “sudo”
		cp /home/cryptek/.Xauthority /root/.Xauthority
				
		#NVML: cannot get current temperature, error 15
		export overclockingThresholdString="W"
		export overclockingThresholdString=$voltageLimit$overclockingThresholdString
		
		  if nvidia-smi | grep -io "/ $overclockingThresholdString" >/dev/null 2>&1; then
				echo "$(date) Overclocking is correctly applied"
			else
			 echo "$(date) Overclocking is not set, overclock!"
			 #sh /home/cryptek/overclocking.sh
			 startOverclocking
			 if nvidia-smi | grep "Reboot the system to recover this GPU" >/dev/null 2>&1; then
				echo "$(date) GPU is locked, Nvidia-SMI is not able to apply overclocking, RIG is going to reboot."
				echo "$(date) GPU is locked, Nvidia-SMI is not able to apply overclocking, RIG is going to reboot." | mail -s "$(hostname) Miner WatchDog Restart" semias@gmail.com,toan.nguyen.doan@gmail.com
				tail -n64 $claymoreLogFile > "/tmp/watchdog_error_$(date)"

				# Kill all instances of ethminer
				killall "ethdcrminer64"
				ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
				# Restart mining rig
				/sbin/shutdown 2 -f -r
				exit
			 fi
		   fi


		  if nvidia-smi -L | grep -io "GPU $nbrGPU" >/dev/null 2>&1; then

			echo "Miner already running."
		  else
			tail -n64 $claymoreLogFile > "/tmp/watchdog_error_$(date)"

			ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
			echo "$(date) One GPU Missing!!! Miner requires restart "
			echo "$(date) One GPU Missing!!! Miner requires restart " | mail -s "$(hostname) Miner WatchDog Restart" semias@gmail.com,toan.nguyen.doan@gmail.com
			killall "ethdcrminer64"
			# Restart mining rig
			/sbin/shutdown 2 -f -r
		  fi
	fi	  
	  
	else
		##if claymore crash on start (process is then never running)
#	 if tail -n4 $claymoreLogFile | grep -io "error 10" >/dev/null 2>&1;  then
#
#			tail -n64 $claymoreLogFile > "/tmp/watchdog_error_$(date)"
#
#			# Kill all instances of ethminer
#			killall "ethdcrminer64"
#			ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
#			echo "$(date) Miner requires restart due to error : NVML: cannot get current temperature, error 15"
#			# Send mail
#			echo "$(date) Miner requires restart due to error  :  cudaGetDeviceCount returned error 10 " | mail -s "$(hostname) Miner WatchDog Restart" semias@gmail.com,toan.nguyen.doan@gmail.com
#
#			# Restart mining rig
#			/sbin/shutdown 20 -f -r
#
#			# Abandon WatchDog
#			exit
#
#	  fi
	  
	
	  echo "$(date) Miner was not started. Starting Miner!"
	#    if nvidia-smi -q | grep "75 %" >/dev/null 2>&1; then
	  ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill  >/dev/null 2>&1

	  screen -mdS Mining bash -c 'cd $claymoreFolder ; $claymoreRunScript ; exec bash'

	#   else
	 #       echo "Fans are down! Fuck!"
	#    fi
	fi 
}