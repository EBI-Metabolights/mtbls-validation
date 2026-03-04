#!/bin/bash
rm -rf Zipped

for i in */; do zip -r "${i%/}.zip" "$i"; done

mkdir -p Zipped
mv *.zip Zipped/.

