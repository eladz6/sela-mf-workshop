#!/bin/bash

WD=$PWD
APP='app'
BLUE_PODLET='../../demos/demo-01/blue-podlet'
RED_PODLET='../../demos/demo-01/red-podlet'
GREEN_PODLET='../../demos/demo-01/green-podlet'
PURPLE_PODLET='purple-podlet'
MFs=($APP $BLUE_PODLET $GREEN_PODLET $RED_PODLET $PURPLE_PODLET)

for MF in "${MFs[@]}"
do
  cd $MF
  npm install
  cd $WD
done

(trap 'kill 0' SIGINT; (cd $APP && npm start) & (cd $BLUE_PODLET && npm start) & (cd $RED_PODLET && npm start) & (cd $GREEN_PODLET && npm start) & (cd $PURPLE_PODLET && npm start))
