#!/usr/bin/expect -f
set map [lindex $argv 0]
spawn ssh root@192.168.178.40
expect "password:"
send "cleaner\r"
expect "root@rockrobo:~#"
send "sh restoreMap.sh $map\r"
expect "root@rockrobo:~#"
send "exit\r"
