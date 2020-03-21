echo "usage: copyPicon.sh piconname.png <full path to zet71 update>"
echo "Example: /DuckboxDisk/github/eePicons/piconService/copyPicon.sh polstaseriale.png /media/sf_szare_wirtualek/"
echo 
piconName=$1
Source=$2
[ -z $piconName ] && exit 1
#echo $piconName
[ -z $Source ] && exit 1
#echo $Source

DestMain="/DuckboxDisk/github/eePicons/piconService"
pikonDepth='8bit'

find "$Source" -type f \( -iname [bgnstw]*220*.png -o -iname [bgnstw]*400*.png \)|while read f; do
  pikonType='FAKE'
  fName=`basename "$f"|sed 's/\.png//g;s/ //g;s/_//g'|tr "[:upper:]" "[:lower:]"`
  if [ `echo $fName|grep -c '220'` -gt 0 ]; then
    pikonSize='220x132'
  elif [ `echo $fName|grep -c '400'` -gt 0 ];then
    pikonSize='400x170'
  fi
  if [[ $fName =~ ^blue1.* ]]; then
    pikonType='Blue 1'
  elif [[ $fName =~ ^blue2.* ]]; then
    pikonType='Blue 2'
  elif [[ $fName =~ ^green.* ]]; then
    pikonType='Green'
  elif [[ $fName =~ ^noname1.* ]]; then
    pikonType='NoName 1'
  elif [[ $fName =~ ^noname2.* ]]; then
    pikonType='NoName 2'
  elif [[ $fName =~ ^noname3.* ]]; then
    pikonType='NoName 3'
  elif [[ $fName =~ ^noname4.* ]]; then
    pikonType='NoName 4'
  elif [[ $fName =~ ^noname5.* ]]; then
    pikonType='NoName 5'
  elif [[ $fName =~ ^siennaroot1.* ]]; then
    pikonType='SiennaRoot 1'
  elif [[ $fName =~ ^siennaroot2.* ]]; then
    pikonType='SiennaRoot 2'
  elif [[ $fName =~ ^silverblack1.* ]]; then
    pikonType='Silver-Black 1'
  elif [[ $fName =~ ^silverblack2.* ]]; then
    pikonType='Silver-Black 2'
  elif [[ $fName =~ ^star.* ]]; then
    pikonType='Star'
  elif [[ $fName =~ ^transparent1.* ]]; then
    pikonType='Transparent 1'
  elif [[ $fName =~ ^tr1.* ]]; then
    pikonType='Transparent 1'
  elif [[ $fName =~ ^transparent2.* ]]; then
    pikonType='Transparent 2'
  elif [[ $fName =~ ^tr2.* ]]; then
    pikonType='Transparent 2'
  elif [[ $fName =~ ^white1.* ]]; then
    pikonType='White 1'
  elif [[ $fName =~ ^white2.* ]]; then
    pikonType='White 2'
  elif [[ $fName =~ ^FAKE.* ]]; then
    pikonType='FAKE'
  fi
  if [[ "$pikonType" != "FAKE" ]];then
    echo "$fName = $DestMain/$pikonType/$pikonDepth/$pikonSize/$piconName"
    mv -f "$f" "$DestMain/$pikonType/$pikonDepth/$pikonSize/$piconName"
  else
    echo "FAKE $fName = $DestMain/$pikonType/$pikonDepth/$pikonSize/$piconName"
  fi
done
