#!/usr/bin/expect

rm -r /home/automate/.ssh/*
spawn ssh oliver@192.168.178.37
expect "?"
send "yes\r"
interact
#expect "yes/no" { send "yes\r" expect "*?assword" { send "[lindex $argv 2]\r" } } "*?assword" { send "[lindex $argv 2]\r" } expect "# " { send "su - [lindex $argv 3]\r" } expect ": " { send "[lindex $argv 4]\r" } expect "# " { send "ls -ltr\r" } interact