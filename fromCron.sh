#! /bin/bash
## wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/fromCron.sh | sh ; chmod +x ~/temp.sh ; sh ~/temp.sh; rm ~/temp.sh;

echo "#! /bin/bash" > ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Parameters.sh >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/watchdog.sh >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Overclocking.sh >> ~/temp.sh
 echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_parameters.sh >> ~/temp.sh
echo " "
 wget -O -  https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_overcklocking.sh >> ~/temp.sh
echo " "
echo " "  >> ~/temp.sh
echo "watchdog" >> ~/temp.sh
echo " " >> ~/temp.sh
