#!/bin/bash
password=$1
/usr/bin/expect <<EOD
spawn passwd
expect "New password:"
send -- "$password\r"
expect "Retype new password:"
send -- "$password\r"
interact
EOD
echo "you're out"
