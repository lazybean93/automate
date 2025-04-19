for i in $(find * -type f | sort -h); do
    echo ----------------------------
    echo $i
    echo ----------------------------
    cat "$i" | grep -C1 "$1"
done
