#!/bin/bash

MFs=('app' 'blue-podlet' 'green-podlet' 'red-podlet')

for MF in "${MFs[@]}"
do
  cd $MF
  npm install
  cd ..
done

(trap 'kill 0' SIGINT; (cd app && npm start) & (cd blue-podlet && npm start) & (cd red-podlet && npm start) & (cd green-podlet && npm start))
