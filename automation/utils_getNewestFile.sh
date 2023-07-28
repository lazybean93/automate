find $1 -cmin -2 -type f -exec ls -tr {} + | tail -n1
