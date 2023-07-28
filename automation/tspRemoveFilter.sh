if [ ! -z "$1" ]; then
	for i in $(tsp | grep ' 0 \| 1 ' | grep "$1" | sed 's/finished/\n/g' | grep -v '[a-zA-Z]' | sed 's/\ //g'); do
		tsp -r $i;
	done
fi
tsp
