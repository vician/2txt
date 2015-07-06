#!/bin/bash
# script prevede vsechny *.pdb v adtualnim adresari z cp-1250 do UTF-8 v txt formatu
`./rename.sh`
echo "Vytvarim adresar ./output"
mkdir -p ./output
echo "Kopiruji vsechny .pdb soubory do adresare ./output"
cp ./*.pdb ./output/
  
echo "Konvertuji z pdb do txt"
cd ./output
for i in *.pdb
do
       echo -n -e "\rConverting PDB->TXT: $i                          \t\t\t\t"
       txt2pdbdoc -d "./${i%%.pdb}.pdb" "./${i%%.pdb}.txt"
       rm "./${i%%.pdb}.pdb"
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
