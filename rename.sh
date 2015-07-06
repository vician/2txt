#!/bin/bash
for i in *.PDB
do
       echo -n -e "\rRENAME: $i: "
       mv "./${i%%.PDB}.PDB" "./${i%%.PDB}.pdb"
done

for i in *.Pdb
do
       echo -n -e "\rRENAME: $i: "
       mv "./${i%%.Pdb}.Pdb" "./${i%%.Pdb}.pdb"
done

for i in *.DOC
do
       echo -n -e "\rRENAME: $i: "
       mv "./${i%%.DOC}.DOC" "./${i%%.DOC}.doc"
done

for i in *.Doc
do
       echo -n -e "\rRENAME: $i: "
       mv "./${i%%.Doc}.Doc" "./${i%%.Doc}.doc"
done

