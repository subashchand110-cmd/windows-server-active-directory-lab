# Network Documentation

## Overview

This document describes the network configuration for the Windows Server 2025 Active Directory home lab.

The lab currently consists of a single Windows Server virtual machine hosted on Oracle VirtualBox using NAT networking.

---

# Network Topology

Host Computer (Windows 11)
↓
Oracle VirtualBox
↓
Windows Server 2025 (SERVER2025-DC01)
↓
Active Directory Domain Services
↓
DNS

---

# Network Configuration

| Setting | Value |
|---------|-------|
| Network Type | NAT |
| IPv4 Address | 192.168.1.10 |
| Subnet Mask | 255.255.255.0 |
| Default Gateway | 192.168.1.1 |
| Preferred DNS | 127.0.0.1 |
| DHCP | Disabled |

---

# Why a Static IP?

The Domain Controller has been configured with a static IP address to ensure that clients can consistently locate Active Directory and DNS services.

Using DHCP for a Domain Controller is not recommended because changing IP addresses can cause authentication and name resolution issues.

---

# DNS Configuration

The server is configured to use its own DNS service by pointing the Preferred DNS server to:

127.0.0.1

This allows the Domain Controller to resolve Active Directory records locally.

---

# Current Devices

| Device | Role |
|---------|------|
| Windows 11 Host | Host Operating System |
| SERVER2025-DC01 | Domain Controller |
| CLIENT01 | Windows 11 domain client

---

# Planned Expansion

The following devices and services will be added as the lab grows:

- DHCP Server
- Group Policy
- File Server
- Additional users and computers
- Remote Administration
- PowerShell automation

---

## Client Systems

### CLIENT01

- Operating System: Windows 11 Pro
- Computer Name: CLIENT01
- Role: Domain Client
- Status: Domain Joined (mydomain.com)

---
# Notes

This document will be updated as additional virtual machines, services, and networking components are introduced.