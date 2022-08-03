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
crypto ipsec ips1
 key <r1-private-key><r2-public-key>
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
crypto ipsec ips1
 key <r2-private-key><r1-public-key>
 exit
!
!
```