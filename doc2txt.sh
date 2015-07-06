#!/bin/bash
# script prevede vsechny *.pdb v adtualnim adresari z cp-1250 do UTF-8 v txt formatu
`./rename.sh`

echo "Vytvarim adresar ./output"
mkdir -p ./output
echo "Kopiruji vsechny .pdb soubory do adresare ./output"
cp ./*.doc ./output/

echo "Konvertuji z doc do txt"
cd ./output
for i in *.doc
do
       echo -n -e "\rConverting DOC->TXT: $i                          \t\t\t\t"
       catdoc -w "./${i%%.doc}.doc" > "./${i%%.doc}.txt"
       rm "./${i%%.doc}.doc"
done
  
#echo
echo "Prekodovavam z CP1250 do UTF8"
for i in *.txt
do
       echo -n -e "\rRecoding: $i                                                          \t\t\t\t"
       recode -v windows-1250..UTF-8 "./${i%%.txt}.txt"
done
  
cd ..
echo "Hotovo"
