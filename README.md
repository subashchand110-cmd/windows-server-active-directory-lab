# Windows Server Active Directory Lab

A hands-on Windows Server lab built to learn enterprise Active Directory administration using Windows Server 2025 and Windows 11.

---

## Project Overview

This project demonstrates the deployment and administration of a Windows Active Directory environment including:

- Active Directory Domain Services (AD DS)
- DNS
- Organizational Units (OUs)
- Users and Groups
- Domain-joined Windows 11 Client
- Group Policy (coming next)
- File Services (planned)
- DHCP (planned)
- PowerShell Automation (planned)

---

## Lab Environment

| Component | Details |
|-----------|---------|
| Hypervisor | Oracle VirtualBox |
| Server OS | Windows Server 2025 Standard Evaluation |
| Client OS | Windows 11 Pro |
| Domain | mydomain.com |
| Domain Controller | SERVER2025-DC01 |

---

## Network Configuration

| Device | IP Address |
|---------|------------|
| Domain Controller | 192.168.1.10 |
| DNS Server | 192.168.1.10 |
| Client | Static IP on same subnet |

---

## Completed

### Phase 1 – Active Directory Infrastructure

- Installed Windows Server 2025
- Promoted server to Domain Controller
- Installed DNS
- Created Active Directory domain
- Created Organizational Units
- Created security groups
- Created domain users

### Organizational Units

- Admin
- Employee Accounts
- Workstations
- Member Servers
- Security Groups
- Service Accounts

### Security Groups

- IT Support
- Human Resources
- Finance
- Sales

### Domain Users

- subash.admin
- subash
- john.smith
- sarah.johnson
- michael.brown
- emily.davis

---

### Phase 2 – Windows 11 Client Integration

- Installed Windows 11 Pro
- Configured networking
- Configured DNS
- Joined CLIENT01 to mydomain.com
- Verified Active Directory authentication
- Logged in using domain accounts
- Verified security group membership
- Moved CLIENT01 into the Workstations OU

---

## Project Status

- Phase 1 – Active Directory Infrastructure - done
- Phase 2 – Windows 11 Client Integration - done
- Phase 3 – Group Policy - in progress
- Phase 4 – File Server & NTFS Permissions
- Phase 5 – DHCP
- Phase 6 – PowerShell Automation

---

## Skills Demonstrated

- Windows Server Administration
- Active Directory
- DNS
- User & Group Management
- Organizational Units
- Domain Administration
- Windows Client Management

---

## Author

**Subash Chand**