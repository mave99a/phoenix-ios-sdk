#! /bin/sh

cd "$(dirname "$0")"

rm -r output/ObjC

coffee add-mapping.litcoffee

coffee generate-objc.litcoffee

cp -rf output/ObjC/* ../../Models/