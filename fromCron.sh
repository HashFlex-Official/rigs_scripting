#! /bin/sh
## wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/fromCron.sh | sh ; chmod +x ~/temp.sh ; sh ~/temp.sh  >> /tmp/watchdog.log 2>&1; rm ~/temp.sh
echo "#! /bin/sh" > ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Parameters.sh >> ~/temp.sh
 echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_parameters.sh >> ~/temp.sh
 echo " "
 sh ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/watchdog.sh >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Overclocking.sh >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_inc.sh >> ~/temp.sh
echo " " >> ~/temp.sh 	
echo "exec >> $logPath 2>&1	" >> ~/temp.sh
echo " "  >> ~/temp.sh
echo "watchdog" >> ~/temp.sh
echo " " >> ~/temp.sh
