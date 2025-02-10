# Cisco IOS

## Tools

Simulation:

* Cisco Packet Tracer 
* 2911 is a good router for testing

## Basic

Configuration mode:

```
configure terminal
```

Write to disk:

```
write
```

Show configuration:

```
show run
```

Show access lists:

```shell
show access-lists
```

## New Router

Disable ip lookup:

```
no ip domain-lookup
```

Set hostname:

```
hostname router01
```

Set password:

```
enable secret <password>
```

Create user:

```
username user01 secret <password>
```

Enforce login via Console:

```
line con 0
login local
logging synchronous
history size 15
```

Enable SSH:

```
line vty 0 15
login local
transport input ssh
```

Generate Certificate:

```
ip domain-name ifa.ch
ip ssh version 2
crypto key generate rsa # 2040
```

Set trunkmode:

```
interface gigabitEthernet0/1
switchport mode trunk
switchport trunk allowed vlan 1
```

Mode:

* Trunkmode: Between Routers
* Access Mode: Between Router Client

Enable Interface:

```
no shutdown
```

## Password

Unsafe:

```
# plaintext
enable password <password>
```

Safer:

```
enable secret <password>
```

## Create VLAN

```
vlan 20
name GL
```

## Configure VLAN on Switch

Configure VLAN:

```
interface vlan 1
ip address 192.168.1.200 255.255.255.0
```

Move Interface to vlan:

```
interface fastEthernet0/1
switchport mode access 
switchport access vlan 1
```

## Configure VLAN on Router

```
interface <Schnittstellen-Typ><Schnittstellen-Nummer>.<VLAN-ID> 
encapsulation dot1Q <VLAN-ID> 
ip address <IP-Adresse> <Subnetzmaske>
```

## Show

Network configuration:

```
show ip interface brief
```

```
show vlan brief
```
