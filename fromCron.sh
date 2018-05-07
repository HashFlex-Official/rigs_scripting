#! /bin/sh
## wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/fromCron.sh | sh ; chmod +x ~/temp.sh ; sh ~/temp.sh  >> /tmp/watchdog.log 2>&1; rm ~/temp.sh

export logPath="/tmp/watchdog.log"
#echo "REBOOOOOT!" >> /tmp/watchdog.log
			
echo "#! /bin/sh" > ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Parameters.sh >> ~/temp.sh
 echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_parameters.sh >> ~/temp.sh
 echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/watchdog.sh >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Overclocking.sh >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_inc.sh >> ~/temp.sh
echo " " >> ~/temp.sh 	
 echo "tail -n 10000 $logPath > /tmp/watchdogTemp.log; m	v /tmp/watchdogTemp.log $logPath"  >> ~/temp.sh
echo " "  >> ~/temp.sh
 echo "exec >> $logPath 2>&1	" >> ~/temp.sh
echo " "  >> ~/temp.sh
echo "watchdog" >> ~/temp.sh
echo " " >> ~/temp.sh
#fix to Invalid MIT-MAGIC-COOKIE-1 When “sudo”
cp /home/cryptek/.Xauthority /root/.Xauthority