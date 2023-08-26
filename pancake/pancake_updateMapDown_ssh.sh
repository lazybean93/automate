#!/usr/bin/expect -f
spawn ssh root@192.168.178.40
expect "password:"
send "cleaner\r"
expect "root@rockrobo:~#"
send "sh updateDownMap.sh\r"
expect "root@rockrobo:~#"
send "exit\r"
