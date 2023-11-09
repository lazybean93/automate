. "$HOME""/automation/env.sh"

if [ $# -ne 1 ]; then
	exit
fi

date --date="+$1 Seconds" +%s
