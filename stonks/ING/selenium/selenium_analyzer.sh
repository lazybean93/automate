for i in $(ls | grep html); do
	cat "$i" | sed 's/>/\r\n/g' | grep 'a href' | grep Investieren | grep '/Aktie/' | sed 's/ie\//\r\n/g' | grep -v href | sed 's/"//g'
done > stocks.txt

cat stocks.txt | sort | uniq > stocks; mv stocks stocks.txt
