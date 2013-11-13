#!/usr/bin/expect --


set user [lindex $argv 0]
set host [lindex $argv 1]
set passwd [lindex $argv 2]

spawn ssh $user@$host
expect "password: "
send "$passwd\r"
expect "$ "
interact
#send "ps -ef |grep sshd\r"
#expect "$ "
#send "exit\r"
