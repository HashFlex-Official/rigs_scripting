#! /bin/sh
## wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/fromCron.sh | sh ; chmod +x ~/temp.sh ; sh ~/temp.sh  >> /tmp/watchdog.log 2>&1; rm ~/temp.sh

export logPath="/tmp/watchdog.log"
#echo "HARD REBOOOOOT!" >> /tmp/watchdog.log
# Restart mining rig
# /sbin/shutdown 1 -f -r
			
echo "#! /bin/sh" > ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Parameters.sh --no-check-certificate >> ~/temp.sh
 echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_parameters.sh --no-check-certificate >> ~/temp.sh
 echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/watchdog.sh --no-check-certificate >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Overclocking.sh --no-check-certificate >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_inc.sh --no-check-certificate >> ~/temp.sh
echo " " >> ~/temp.sh 	
 echo "tail -n 10000 $logPath > /tmp/watchdogTemp.log; mv /tmp/watchdogTemp.log $logPath"  >> ~/temp.sh
echo " "  >> ~/temp.sh
 echo "exec >> $logPath 2>&1	" >> ~/temp.sh
echo " "  >> ~/temp.sh
echo "watchdog" >> ~/temp.sh
echo " " >> ~/temp.sh

echo "1.00" > /tmp/script_version
#	 if cat /tmp/script_version | grep -io "1.00" >/dev/null 2>&1;  then
#			# Kill all instances of ethminer
#			killall "ethdcrminer64"
#			ps aux | grep "mdS Mining" | awk '{print $2}' | xargs kill
#			echo "$(date) Miner has been (soft) restarted to apply change"
#			# Send mail
#			echo "$(date) Miner has been (soft) restarted to apply change" | mail -s "$(hostname) Miner WatchDog Soft Restart" semias@gmail.com,toan.nguyen.doan@gmail.com
#	 fi
