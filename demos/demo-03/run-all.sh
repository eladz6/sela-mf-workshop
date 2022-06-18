#!/bin/bash

MFs=('app' 'blue' 'green' 'red')

for MF in "${MFs[@]}"
do
  cd $MF
  npm install
  cd ..
done

(trap 'kill 0' SIGINT; (cd app && npm start) & (cd blue && npm start) & (cd green && npm start) & (cd red && npm start))
