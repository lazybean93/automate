FILES=$(ls $HOME/Downloads | grep $1 | tail -n 2)

COUNT=0
for i in $FILES; do
	COUNT=$(($COUNT+1))
	cat $HOME/Downloads/$i | sed 's/" data-downloads="[0-9][0-9][0-9][0-9][0-9]"//g' | sed 's/</\n</g' > $COUNT.txt 
done

diff 1.txt 2.txt
rm 1.txt 2.txt
