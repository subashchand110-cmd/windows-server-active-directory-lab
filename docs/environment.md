# Environment Documentation

## Project Overview

This home lab is designed to develop practical skills in Windows Server administration, Active Directory, DNS, DHCP, Group Policy and Windows client management using Oracle VirtualBox.

---

# Host Environment

| Item | Details |
|------|---------|
| Host Operating System | Windows 11 |
| Virtualisation Platform | Oracle VirtualBox |
| Lab Purpose | Windows Server & Active Directory Home Lab |

---

# Virtual Machine

| Item | Details |
|------|---------|
| VM Name | Windows Server 2025 |
| VirtualBox Guest Profile | Windows Server 2022 (64-bit) |
| Installed Operating System | Windows Server 2025 Standard Evaluation |
| Memory | 4096 MB |
| CPU | 4 vCPUs |
| Network Adapter | NAT |

---

# Windows Server

| Item | Details |
|------|---------|
| Computer Name | SERVER2025-DC01 |
| Operating System | Microsoft Windows Server 2025 Standard Evaluation |
| OS Version | 10.0.26100 |
| Server Role | Primary Domain Controller |
| Domain | mydomain.com |
| IPv4 Address | 192.168.1.10 |
| Subnet Mask | 255.255.255.0 |
| Default Gateway | 192.168.1.1 |
| Preferred DNS | 127.0.0.1 |
| DHCP | Disabled (Static IP) |

---

# Current Configuration

## Completed

- Windows Server installed
- Static IP configured
- Active Directory Domain Services installed
- Server promoted to Domain Controller
- DNS configured

## Planned

- Windows 11 Client
- Domain Join
- DHCP Server
- Group Policy
- User Management
- Security Policies
- Active Directory Administration

---

# Notes

This document represents the baseline configuration before expanding the lab with additional Windows clients and infrastructure services.