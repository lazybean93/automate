#!/usr/bin/expect

#expect "Are you sure you want to continue connecting (yes/no/[fingerprint])?"

spawn ssh oliver@192.168.178.37
interact
#expect "yes/no" { send "yes\r" expect "*?assword" { send "[lindex $argv 2]\r" } } "*?assword" { send "[lindex $argv 2]\r" } expect "# " { send "su - [lindex $argv 3]\r" } expect ": " { send "[lindex $argv 4]\r" } expect "# " { send "ls -ltr\r" } interact