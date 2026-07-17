# Active Directory Documentation

## Overview

This document records the Active Directory configuration for the Windows Server 2025 home lab.

The server has been promoted to a Domain Controller and provides Active Directory Domain Services (AD DS) for the `mydomain.com` domain.

---

# Domain Information

| Item | Details |
|------|---------|
| Domain Name | mydomain.com |
| Domain Controller | SERVER2025-DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Server Role | Primary Domain Controller |

---

# Organisational Units (OUs)

The following custom Organizational Units have been created to organise Active Directory objects within the domain.

| Organizational Unit | Purpose |
|---------------------|---------|
| Admin OU | Stores administrative user accounts with elevated privileges. |
| Employee Accounts | Stores standard domain user accounts. |
| Workstations | Stores domain-joined client computers. |
| Member Servers | Stores member servers that are joined to the domain but are not Domain Controllers. |
| Security Groups | Stores custom security groups. |
| Service Accounts | Stores service accounts used by applications and scheduled tasks. |

---

# Users

## Administrative Accounts

| Username | Description |
|----------|-------------|
| Administrator | Built-in domain administrator account. |
| subash.admin | Dedicated administrative account used for domain administration. |

## Standard User Accounts

| Username | Department |
|----------|------------|
| subash | Standard user |
| john.smith | IT Support |
| sarah.johnson | Human Resources |
| michael.brown | Finance |
| emily.davis | Sales |

---

# Security Groups

The following custom Global Security Groups have been created.

| Group | Purpose |
|-------|---------|
| IT Support | IT department staff |
| Human Resources | Human Resources staff |
| Finance | Finance department staff |
| Sales | Sales department staff |

## Group Memberships

| User | Group |
|------|-------|
| john.smith | IT Support |
| sarah.johnson | Human Resources |
| michael.brown | Finance |
| emily.davis | Sales |
| subash.admin | Domain Admins |

---

# Current Status

## Completed

- Installed Active Directory Domain Services
- Promoted server to Domain Controller
- Created `mydomain.com`
- Created custom Organizational Units
- Created standard user accounts
- Created administrative account
- Created departmental security groups
- Assigned users to security groups

## Planned

- Join Windows 11 client to the domain
- Configure Group Policy Objects (GPOs)
- Configure DHCP Server
- Configure shared folders and NTFS permissions
- Implement PowerShell automation
---

# Notes

The Active Directory environment now includes a structured Organizational Unit hierarchy, administrative and standard user accounts, and departmental security groups. The next phase of the project is to join a Windows 11 client to the domain and begin implementing Group Policy and additional infrastructure services.