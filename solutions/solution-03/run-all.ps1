#! /usr/bin/pwsh

$WD = (pwd).Path
$APP = 'app'
$BLUE_PODLET = '../../demos/demo-01/blue-podlet'
$RED_PODLET = 'red'
$GREEN_PODLET = '../../demos/demo-01/green-podlet'
$PURPLE_PODLET = 'purple-podlet'
$MFs = @($APP,$BLUE_PODLET,$GREEN_PODLET,$RED_PODLET,$PURPLE_PODLET)

foreach ( $MF in $MFs )
{
  cd $MF
  npm install
  cd ..
}

npx concurrently "npm --prefix $APP run start" "npm --prefix $BLUE_PODLET run start" "npm --prefix $RED_PODLET run start" "npm --prefix $GREEN_PODLET run start" "npm --prefix $PURPLE_PODLET run start"
