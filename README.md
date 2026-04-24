# nla_tester

nla_tester is a simple utility designed to demonstrate the critical role of Network Level Authentication (NLA) in Remote Desktop Protocol (RDP) security. By enabling NLA, you enhance the security of your RDP connections by preventing unauthorized access to your login screen and user credentials.

## Overview

When NLA is disabled, an attacker can potentially view the Windows lock/login screen and extract usernames, which could lead to further exploitation. This tool helps in identifying such misconfigurations by generating a temporary RDP file and attempting to connect using it.

### Key Features:
- **Simplified RDP Connection**: Automates the creation of an RDP configuration file that bypasses NLA.
- **Real-Time Security Assessment**: Allows you to test if your system is vulnerable to NLA misconfigurations.
- **Enhanced Security Awareness**: Provides a practical demonstration of why NLA is crucial for secure RDP environments.

## Usage

To use nla_tester, follow these steps:

1. Download the `NLA_Tester.ps1` script.
2. Open a PowerShell window with administrative privileges.
3. Run the script by providing the target IP address or hostname:
   ```powershell
   .\NLA_Tester.ps1 -target <ip>
   ```
   ```powershell
   .\NLA_Tester.ps1 -target <host>
   ```
   For example:
   ```powershell
   .\NLA_Tester.ps1 -target 69.221.110.100
   ```

## Example Output

- **Successful NLA Configuration**:
  If your system has proper NLA configuration, you will receive an error message indicating that the RDP connection failed due to authentication issues. *(Which is what you want to see.)*

- **NLA Misconfiguration**:
  If NLA is disabled, nla_tester will present a login screen, potentially showing usernames visible on the lockscreen, demonstrating the potential security risk of valid account enumeration. 
 
![alt text](https://github.com/ArronJablonowski/nla_tester/blob/main/NLA_smaller.png?raw=true)

