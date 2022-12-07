# SSH

## Port Forwarding

* Local port forwarding: `127.0.0.1:5432 -> ssh-server -> 127.0.0.1:5432`
* Remote port forwarding: `Public -> ssh-server:8080 -> localhost:80`
* Dynamic port forwarding: `*:3000 -> ssh-server -> *:*`

https://robotmoon.com/ssh-tunnels/

## Port Forwarding after Connection

1. Enter
2. `~C`
3. `-L 19999:127.0.0.1:19999`

## OpenSSH-Server

Quick and dirty:

```shell
apt-get install -y openssh-server
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
mkdir -p /root/.ssh && curl "https://github.com/<gitlab-user>.keys" >> /root/.ssh/authorized_keys
service ssh restart
```
