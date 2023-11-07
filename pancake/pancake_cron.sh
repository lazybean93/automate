crontab -l > mycron
echo "0 6 * * 1-5 for i in \$(seq 1 3); do tsp sh /home/oliver/pancake/pancake_start_BatteryCharged.sh; done" >> mycron
echo "0 7 * * 6-7 for i in \$(seq 1 2); do tsp sh /home/oliver/pancake/pancake_start_BatteryCharged.sh; done" >> mycron
echo "0 10 * * * tsp sh /home/oliver/pancake/pancake_toTarget_BatteryCharged_loadMapUp.sh" >> mycron
echo "0 22 * * * tsp sh /home/oliver/pancake/pancake_cancelEverything.sh" >> mycron
crontab mycron
rm mycron
