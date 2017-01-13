#!/bin/sh

if [ "$#" -eq "0" ]; then
  echo "Download shared links from Google drive"
  echo
  echo "Usage: $0 https://drive.google.com/open?id=012345ABC-0BeWkFHS1h2VVNLMkk"
  exit 0
fi

ggID=`echo $1 | sed s/.*id=//`
ggURL='https://drive.google.com/uc?export=download'  
ggCookie=/tmp/.gdown.$ggID
filename="$(curl -sc $ggCookie "${ggURL}&id=${ggID}" | grep -o '="uc-name.*</span>' | sed 's/.*">//;s/<.a> .*//')"  
getcode="$(awk '/_warning_/ {print $NF}' $ggCookie)"  
curl -Lb $ggCookie "${ggURL}&confirm=${getcode}&id=${ggID}" -o "${filename}"
rm $ggCookie
