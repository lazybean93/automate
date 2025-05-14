#!/usr/bin/expect

spawn ssh oliver@[lindex $argv 0]
expect "?"
send "yes\r"
expect "password"
send "[lindex $argv 1]\r"
expect "$"
interact 
#expect "yes/no" { send "yes\r" expect "*?assword" { send "[lindex $argv 2]\r" } } "*?assword" { send "[lindex $argv 2]\r" } expect "# " { send "su - [lindex $argv 3]\r" } expect ": " { send "[lindex $argv 4]\r" } expect "# " { send "ls -ltr\r" } interact