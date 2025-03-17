crontab -l > "$HOME""/mycron"

echo "* * * * * tsp sh "$HOME""/pankeep/pankeep.sh"" >> "$HOME""/mycron"
#echo "0 7 * * 6-7 for i in \$(seq 1 2); do tsp sh "$HOME""/pancake/pancake_start_BatteryCharged.sh"; done" >> "$HOME""/mycron"
#echo "0 10 * * * tsp sh "$HOME""/pancake/pancake_toTarget_BatteryCharged_loadMapUp.sh"" >> "$HOME""/mycron"
#echo "0 22 * * * tsp sh "$HOME""/pancake/pancake_cancelEverything.sh"" >> "$HOME""/mycron"
#echo "" >> "$HOME""/mycron"

crontab "$HOME""/mycron"
rm "$HOME""/mycron"
