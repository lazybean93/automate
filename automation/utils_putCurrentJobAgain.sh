#tsp | grep running | head -n1
#ps -ef | grep $(tsp -p) | head -n1
tsp $(tsp -i | grep Command: | sed 's/Command: //g')
