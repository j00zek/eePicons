echo "usage: copyPicon.sh sourceName.png DestName.png"
echo "Example: /DuckboxDisk/github/eePicons/pduplicatePiconToAnotherName.sh travelchannelhd.png travelhd.png"
echo 
sourceName=$1
destName=$2
[ -z $sourceName ] && exit 1
#echo $piconName
[ -z $destName ] && exit 1
#echo $Source

echo "searching..."
find /DuckboxDisk/github/eePicons/piconService/ -type f -iname $sourceName|while read f; do
 #echo  $f
 dName=`dirname "$f"`
 cp -f "$f" "$dName/$destName"
 #echo $dName
 #echo "$f > $dName/$destName"
done
