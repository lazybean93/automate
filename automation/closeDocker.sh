#!/usr/bin/expect

spawn "ssh oliver@192.168.178.37"
expect "Are you sure you want to continue connecting (yes/no/[fingerprint])?"