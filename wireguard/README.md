# Wireguard freeRtr

## Experiment one - Tunnel point-to-point Tunnel wireguard

### Topology

### Install Wireguard
```
$ sudo apt install wireguard
```


### Generating pair keys wireguard vm
```
$ umask 077 && wg genkey > r1-private-key && wg pubkey < r1-private-key > r1-public-key
$ umask 077 && wg genkey > r2-private-key && wg pubkey < r2-private-key > r2-public-key
```

### Configuration R1 and R2


- r1-hw.txt
```

```

- r1-sw.txt
```
!
interface eth1
 desc r1@e1 -> eth0
 vrf forwarding v1
 ipv4 address dynamic /16
 ipv4 gateway-prefix p4
 ipv4 dhcp-client enable
 ipv4 dhcp-client early
 no shutdown
 no log-link-change
 exit
!
crypto ipsec ips1
 key <r1-private-key><r2-public-key>
 exit
!
interface tun1
 desc r2@lo1 -> ????
 tunnel vrf v1
 tunnel protection ips1
 tunnel key 51820
 tunnel mode wireguard
 tunnel source eth1
 tunnel destination 192.168.0.4
 vrf for v1
 ipv4 addr 10.0.0.1 /24
 exit
!
vrf definition v1
 exit
!
```


- r2-hw.txt
```

```

- r2-sw.txt
```
!
!
!
interface eth1
 desc r1@e1 -> eth0
 vrf forwarding v1
 ipv4 address dynamic /16
 ipv4 gateway-prefix p4
 ipv4 dhcp-client enable
 ipv4 dhcp-client early
 no shutdown
 no log-link-change
 exit
!
crypto ipsec ips1
 key <r2-private-key><r1-public-key>
 exit
!
!
interface tun1
 desc r2@lo1 -> ????
 tunnel vrf v1
 tunnel protection ips1
 tunnel key 51820
 tunnel mode wireguard
 tunnel source eth1
 tunnel destination 192.168.0.4
 vrf for v1
 ipv4 addr 10.0.0.1 /24
 exit
!
vrf definition v1
 exit
!
```