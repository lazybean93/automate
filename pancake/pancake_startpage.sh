if [ -n $(ps -ef | grep firefox-esrd | grep -v grep) ]; then 
    sh "$HOME""/automation/utils_startpage.sh" http://192.168.178.40/
fi
