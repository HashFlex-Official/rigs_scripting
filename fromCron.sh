#! /bin/bash
export organisationName="Baaaaad"
echo "#! /bin/bash" > ~/temp.sh
curl https://raw.githubusercontent.com/HashFlex-Official/rigs_scripting/master/Parameters.sh >> ~/temp.sh
export organisationName2="test"
sh ~/temp.sh
echo $organisationName
echo $organisationName2





