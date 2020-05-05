echo "usage: copyPicon.sh piconname.png <full path to zet71 update>"
echo "Example: /DuckboxDisk/github/eePicons/piconService/copyPicon.sh /media/sf_szare_wirtualek/"
echo 
Source=$1
[ -z "$Source" ] && exit 1
#echo $Source

DestMain="/DuckboxDisk/github/eePicons/piconService"
pikonDepth='8bit'

ls "$Source" | while read Name
do
  echo "$Name"
  for pType in 'Blue 1' 'Blue 2' 'Green' 'NoName 1' 'NoName 2' 'NoName 3' 'NoName 4' 'NoName 5' 'SiennaRoot 1' 'SiennaRoot 2' 'Silver-Black 1' 'Silver-Black 2' 'Star' 'Transparent 1' 'Transparent 2' 'White 1' 'White 2'
  do
  if [[ `echo "$Name"|grep -c "$pType"` -eq 1 ]]; then
    echo "pikonType=$pType"
    if [ -d "$Source/$Name/8bit/220x132" ];then
      #echo "cp -f \"$Source/$Name/8bit/220x132/*\" \"$DestMain/$pType/8bit/220x132/\""
      cp -f "$Source/$Name/8bit/220x132/"* "$DestMain/$pType/8bit/220x132/"
    fi
    if [ -d "$Source/$Name/8bit/400x170" ];then
      #echo "copying $Source/$Name/8bit/400x170/* to $DestMain/$pType/8bit/400x170/"
      cp -f "$Source/$Name/8bit/400x170/"* "$DestMain/$pType/8bit/400x170/"
    fi
  fi
  done
done
exit 0

find "$Source" -type f \( -iname [bgnstw]*220*.png -o -iname [bgnstw]*400*.png \)|while read f; do
  pikonType='FAKE'
  fName=`basename "$f"|sed 's/\.png//g;s/ //g;s/_//g'|tr "[:upper:]" "[:lower:]"`
  if [ `echo $fName|grep -c '220'` -gt 0 ]; then
    pikonSize='220x132'
  elif [ `echo $fName|grep -c '400'` -gt 0 ];then
    pikonSize='400x170'
  fi
  if [[ "$pikonType" != "FAKE" ]];then
    echo "$fName = $DestMain/$pikonType/$pikonDepth/$pikonSize/$piconName"
    mv -f "$f" "$DestMain/$pikonType/$pikonDepth/$pikonSize/$piconName"
  else
    echo "FAKE $fName = $DestMain/$pikonType/$pikonDepth/$pikonSize/$piconName"
  fi
done
