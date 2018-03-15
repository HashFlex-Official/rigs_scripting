#! /bin/bash
organisationName="Baaaaad"
echo "#! /bin/bash" > ~/temp.sh
curl https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Parameters.sh >> ~/temp.sh ; chmod +x ~/temp.sh
sh ~/temp.sh

organisationName2="test"
echo $organisationName
echo $organisationName2





