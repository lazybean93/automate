# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`
echo $SCRIPTPATH
echo "$SCRIPTPATH""/selenium_starter.sh"

nohup bash "$SCRIPTPATH""/selenium_starter.sh" >/dev/zero 2>&1 &
#nohup bash selenium_starter.sh >/dev/zero 2>&1 &
