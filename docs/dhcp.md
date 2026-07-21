# DHCP Server

## Overview

In this phase, a DHCP (Dynamic Host Configuration Protocol) server was deployed on the Windows Server 2025 Domain Controller to automatically assign IP addresses and network settings to domain clients.

The DHCP server was integrated with Active Directory and configured with an IPv4 scope for the lab network.

---

## Objectives

- Install the DHCP Server role
- Authorize the DHCP server in Active Directory
- Create and configure an IPv4 scope
- Configure DHCP options
- Automatically assign IP addresses to domain clients
- Verify DHCP lease assignment

---

## Lab Environment

| Component | Value |
|----------|-------|
| Server | SERVER2025-DC01 |
| Domain | mydomain.com |
| DHCP Server | 192.168.1.10 |
| Network | 192.168.1.0/24 |

---

## Installing the DHCP Server Role

The DHCP Server role was installed using Server Manager.

**Steps**

1. Open **Server Manager**
2. Select **Manage → Add Roles and Features**
3. Choose **Role-based or feature-based installation**
4. Select **SERVER2025-DC01**
5. Select **DHCP Server**
6. Install the role

After installation, the **DHCP Post-Install Configuration Wizard** was completed to:

- Authorize the DHCP server in Active Directory
- Create the required DHCP security groups

---

## IPv4 Scope Configuration

A new IPv4 scope named **Corporate LAN** was created.

| Setting | Value |
|---------|-------|
| Scope Name | Corporate LAN |
| Start IP | 192.168.1.100 |
| End IP | 192.168.1.200 |
| Subnet Mask | 255.255.255.0 |
| Lease Duration | 8 Days |
| Scope Status | Active |

---

## DHCP Options

The following DHCP options were configured:

| Option | Value |
|---------|-------|
| DNS Domain | mydomain.com |
| DNS Server | 192.168.1.10 |
| Default Gateway | Not Configured (Lab Environment) |

Since this is an isolated VirtualBox lab, no default gateway was required.

---

## Client Configuration

CLIENT01 was changed from a static IP configuration to automatically obtain an IP address and DNS server from DHCP.

### Commands Used

```cmd
ipconfig /release
ipconfig /renew
ipconfig /all
```

---

## Verification

The client successfully obtained an IP address from the DHCP server.

Example output:

| Setting | Value |
|---------|-------|
| Host Name | CLIENT01 |
| DHCP Enabled | Yes |
| IPv4 Address | 192.168.1.100 |
| DHCP Server | 192.168.1.10 |
| DNS Server | 192.168.1.10 |
| DNS Suffix | mydomain.com |

The client remained joined to the Active Directory domain after switching from a static IP to DHCP.

---

## Skills Demonstrated

- Windows Server DHCP
- DHCP Authorization
- IPv4 Scope Configuration
- DHCP Options
- Automatic IP Address Assignment
- DHCP Lease Verification
- Active Directory Integration

---

## Screenshots

Suggested screenshots:

- DHCP role installed
- DHCP Manager
- IPv4 Scope
- Address Pool
- Address Leases
- Scope Options
- CLIENT01 `ipconfig /all`

---

## Conclusion

The DHCP Server role was successfully deployed and integrated with Active Directory. The DHCP server automatically assigned IP addresses and DNS settings to domain clients, simplifying network management while maintaining seamless domain connectivity.