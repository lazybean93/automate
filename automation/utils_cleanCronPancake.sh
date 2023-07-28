#write out current crontab 59 07 15 09 4 tsp -L "$HOME"/pancake/pancake_runScript_batteryCharged.sh sh "$HOME"/pancake/pancake_runScript_batteryCharged.sh 80 sh "$HOME"/pancake/pancake_start.sh; tsp -u
crontab -l | grep -v 'tsp -u' > mycron
#install new cron file
crontab mycron
rm mycron
