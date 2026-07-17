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

# Default Active Directory Structure

The following containers are created automatically when Active Directory Domain Services (AD DS) is installed and the server is promoted to a Domain Controller.

## Builtin

**Purpose**

The **Builtin** container stores Windows' predefined administrative and security groups. These groups are created automatically and are used to manage permissions and delegate administrative tasks within the domain.

**Examples**

- Administrators
- Backup Operators
- Account Operators
- Print Operators
- Server Operators

---

## Computers

**Purpose**

The **Computers** container is the default location where computer accounts are placed when devices join the domain.

Unless redirected or organised into Organizational Units (OUs), all newly joined computers are stored here.

**Examples**

- Domain-joined workstations
- Member servers

---

## Domain Controllers

**Purpose**

The **Domain Controllers** container stores all Domain Controller computer accounts within the domain.

This container is important because it has a default Group Policy Object (GPO) applied that configures security settings specifically for Domain Controllers.

**Current Objects**

- SERVER2025-DC01

---

## ForeignSecurityPrincipals

**Purpose**

The **ForeignSecurityPrincipals** container stores security principals (users, groups, or computers) from trusted external domains or forests.

These objects are created automatically when permissions are granted to accounts that exist outside the current domain.

**Current Status**

No objects currently exist because no trust relationships have been configured.

---

## Managed Service Accounts

**Purpose**

This container stores Managed Service Accounts (MSAs) and Group Managed Service Accounts (gMSAs).

These accounts allow Windows services and applications to run using automatically managed passwords, improving security and reducing administrative effort.

**Current Status**

No managed service accounts have been created.

---

## Users

**Purpose**

The **Users** container stores the default user accounts and many built-in security groups created during Active Directory installation.

By default, new user accounts are also created here unless Organizational Units are used.

**Default Objects Include**

- Administrator
- Guest
- Default security groups

**Future Plan**

Custom user accounts will be created inside dedicated Organizational Units rather than remaining in the default Users container.

---

# Organisational Units (OUs)

The following custom Organizational Units have been created to organise Active Directory objects as the lab expands.

| Organizational Unit | Purpose |
|---------------------|---------|
| Admin OU | Stores administrative user accounts with elevated privileges. |
| Employee Accounts | Stores standard domain user accounts. |
| Workstations | Stores computer accounts for domain-joined client devices. |
| Member Servers | Stores member servers that are joined to the domain but are not Domain Controllers. |
| Security Groups | Stores custom security groups used for permission management. |
| Service Accounts | Stores accounts used by services and scheduled tasks. |


---

# Users

No custom user accounts have been created.

Only the default Active Directory accounts currently exist.

---

# Groups

Only the default Active Directory security groups currently exist.

---

# Current Status

## Completed

- Active Directory Domain Services installed
- Server promoted to Domain Controller
- Domain created (`mydomain.com`)

## Planned

- Create Organizational Units
- Create administrative users
- Create standard user accounts
- Create security groups
- Configure Group Policy
- Join Windows client to the domain

---

# Notes

This document represents the initial Active Directory configuration before any custom objects or policies have been created.