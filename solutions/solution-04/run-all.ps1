#! /usr/bin/pwsh

$WD = (pwd).Path
$APP = 'app'
$BLUE = '../../demos/demo-04/blue'
$RED = 'red'
$GREEN = '../../demos/demo-04/green'
$PURPLE = 'purple'
$MFs = @($APP,$BLUE,$GREEN,$RED,$PURPLE)

foreach ( $MF in $MFs )
{
  cd $MF
  npm install
  cd ..
}

npx concurrently "npm --prefix $APP run start" "npm --prefix $BLUE run start" "npm --prefix $RED run start" "npm --prefix $GREEN run start" "npm --prefix $PURPLE run start"
