#! /bin/bash
echo "#! /bin/bash" > ~/temp.sh
echo " "
curl   -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Parameters.sh >> ~/temp.sh
echo " "
curl   -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/watchdog.sh >> ~/temp.sh
echo " "
curl   -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Overclocking.sh >> ~/temp.sh
echo " "
curl   -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/`hostname`_overcklocking.sh >> ~/temp.sh
echo " "
echo "overclocking_override()" >> ~/temp.sh