for i in $(find "$HOME""*" -type f | grep -v 'Downloads\|\.tar\|\.log' | grep -v '/whatsapp' | grep -v "$0"); do
	if [ ! -z "$(cat $i | grep '/whatsapp_plannedMessage.sh\|/whatsapp_document.sh\|utils_sendIfNew.sh')" ]; then
		if [ ! -z "$(tsp | grep queued | grep "$i" | sed 's/ /\n/g' | head -n1)" ]; then
			tsp -r "$(tsp | grep queued | grep "$i" | sed 's/ /\n/g' | head -n1)"
		fi
	fi
done
