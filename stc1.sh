#!/bin/bash
apt update
apt install nano
apt install expect -y
apt install ssh -y
apt install net-tools -y

/usr/bin/expect <<EOD
spawn passwd
expect "New password:"
send -- "123456\r"
expect "Retype new password:"
send -- "123456\r"
interact
EOD
echo "you're out"

#nano /etc/ssh/sshd_config

echo "Include /etc/ssh/sshd_config.d/*.conf
PermitRootLogin yes
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server" > /etc/ssh/sshd_config

service ssh restart
