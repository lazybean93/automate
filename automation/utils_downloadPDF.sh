. "$HOME""/automation/env.sh"

sh -c "$WAITLOADED 1"
FILESIZE1=$(ls -lat "$HOME""/Downloads/" | grep '\.pdf' | head -n1 | sed 's/ /\n/g' | grep -v '^$' | tail -n5 | head -n1)
sleep 1
FILESIZE2=$(ls -lat "$HOME""/Downloads/" | grep '\.pdf' | head -n1 | sed 's/ /\n/g' | grep -v '^$' | tail -n5 | head -n1)
while [ "$FILESIZE1" -ne "$FILESIZE2" ]; do
	sleep 1
	FILESIZE1=$FILESIZE2
	FILESIZE2=$(ls -lat "$HOME""/Downloads/" | grep '\.pdf' | head -n1 | sed 's/ /\n/g' | grep -v '^$' | tail -n5 | head -n1)
done
sh -c "$WAITLOADED 1"
