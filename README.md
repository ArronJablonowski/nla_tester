# nla_tester
A simple tool to demonstrate the need for NLA (network level authentication), and test RDP connections for NLA missconfigs. 

A system with a NLA misconfiguration will show a Remote Desktop login screen, including the system's users. Pictured below.  
![alt text](https://github.com/ArronJablonowski/nla_tester/blob/main/NLA_smaller.png?raw=true)

A system with proper NLA configuration will present an error message when attempting to make an RDP connection.

Usage
=====
```Bash
.\NLA_Tester.ps1 -target <ip>
```
```Bash
.\NLA_Tester.ps1 -target `<host>`
```
```Bash
.\NLA_tester.ps1 -target 192.168.1.100
```
