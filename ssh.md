# SSH

## Port Forwarding

* Local port forwarding: `127.0.0.1:5432 -> ssh-server -> 127.0.0.1:5432`
* Remote port forwarding: `Public -> ssh-server:8080 -> localhost:80`
* Dynamic port forwarding: `*:3000 -> ssh-server -> *:*`

## Port Forwarding after Connection

1. Enter
2. `~C`
3. `-L 19999:127.0.0.1:19999`

https://robotmoon.com/ssh-tunnels/
