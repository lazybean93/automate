# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

nohup bash "$SCRIPTPATH""/stocks_collect_process.sh" >/dev/zero 2>&1 &
