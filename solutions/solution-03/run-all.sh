#!/bin/bash

WD=$PWD
APP='app'
BLUE='../../demos/demo-02/blue'
RED='red'
GREEN='../../demos/demo-02/green'
PURPLE='purple'
MFs=($APP $BLUE $GREEN $RED $PURPLE)

for MF in "${MFs[@]}"
do
  cd $MF
  npm install
  cd $WD
done

npx concurrently "npm --prefix $APP run start" "npm --prefix $BLUE run start" "npm --prefix $RED run start" "npm --prefix $GREEN run start" "npm --prefix $PURPLE run start"
