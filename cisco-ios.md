# Cisco IOS

## Configuration Mode

```
enable
configure terminal
```

## Show Commands

```
show running-config
show interface
show ip interface brief
show vlan brief
show interface vlan
show access-lists
show interfaces trunk
```

## Write

```
write
```

## New Router

```
# disable ip lookup
no ip domain-lookup

# set hostname
hostname router01

# set password
enable secret <password>

# create user
username user01 secret <password>

# enforce login via console
line con 0
login local
logging synchronous
history size 15

# enable SSH
line vty 0 15
login local
transport input ssh

# generate certificate
ip domain-name ifa.ch
ip ssh version 2
crypto key generate rsa # 2040
```

## Set Trunkmode

Mode:

* Trunkmode: Between Routers
* Access Mode: Between Router Client

```
interface gigabitEthernet0/1
switchport mode trunk
switchport trunk allowed vlan 1
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
