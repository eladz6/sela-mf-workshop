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

npx concurrently "npm --prefix $APP run start" "npm --prefix $BLUE_PODLET run start" "npm --prefix $RED_PODLET run start" "npm --prefix $GREEN_PODLET run start" "npm --prefix $PURPLE_PODLET run start"
