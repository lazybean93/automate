#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "$1"
echo "$(date --date="$1" +'%M %H %d %m %w')"" ""$2" >> mycron
#install new cron file
crontab mycron
rm mycron
