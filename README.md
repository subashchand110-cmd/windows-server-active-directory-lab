# Windows Server Active Directory Home Lab

A hands-on Windows Server home lab built using **Oracle VirtualBox** to gain practical experience with enterprise Windows Server administration, Active Directory, Group Policy, networking, file services, Public Key Infrastructure (PKI), and centralized Windows Update management.

The lab follows a phased approach, with each phase focusing on a core Windows Server technology commonly found in enterprise environments.

---

## Lab Environment

| Component | Details |
|----------|---------|
| Hypervisor | Oracle VirtualBox |
| Host OS | Windows 11 |
| Server OS | Windows Server 2025 Standard Evaluation |
| Client OS | Windows 11 Pro |
| Domain | mydomain.com |
| Domain Controller | SERVER2025-DC01 |
| Client | CLIENT01 |

---

# Lab Objectives

The purpose of this lab is to gain practical experience with enterprise Windows Server administration by implementing and managing a complete Active Directory environment.

Technologies implemented include:

- Active Directory Domain Services (AD DS)
- DNS
- DHCP
- Group Policy
- Organizational Unit (OU) Management
- User and Group Administration
- File Server
- NTFS Permissions
- SMB File Sharing
- Drive Mapping using Group Policy Preferences
- Active Directory Certificate Services (AD CS)
- Public Key Infrastructure (PKI)
- Windows Server Update Services (WSUS)
- Windows Server Backup
- Backup and Disaster Recovery
- Distributed File System (DFS) Namespaces
---

# Lab Phases

## Phase 1 – Active Directory Domain Services

Implemented:

- Installed Windows Server 2025
- Promoted server to Domain Controller
- Configured DNS
- Created Organizational Units (OUs)
- Created domain users
- Created security groups
- Joined Windows 11 client to the domain

Documentation:

- [Active Directory Setup](docs/active-directory.md)

---

## Phase 2 – Domain Management

Implemented:

- User administration
- Group management
- Organizational Unit management
- Active Directory best practices

Documentation:

- [Domain Management](docs/domain-management.md)

---

## Phase 3 – Group Policy

Implemented:

- Desktop wallpaper deployment
- Control Panel restrictions
- Command Prompt restrictions
- Interactive logon banner
- Password Policy
- Account Lockout Policy

Documentation:

- [Group Policy](docs/group-policy.md)

---

## Phase 4 – File Server

Implemented:

- Secondary storage configuration
- NTFS permissions
- Departmental folders
- SMB shares
- Access testing

Departments:

- HR
- Finance
- Sales
- IT
- Public

Documentation:

- [File Server](docs/file-server.md)

---

## Phase 5 – Drive Mapping

Implemented:

- Group Policy Preferences
- Automatic drive mapping
- Item-Level Targeting
- Department-specific drive mappings

Mapped Drives:

| Drive | Department |
|-------|------------|
| P: | Public |
| H: | Human Resources |
| F: | Finance |
| S: | Sales |
| I: | IT Support |

Documentation:

- [Drive Mapping](docs/drive-mapping.md)

---

## Phase 6 – DHCP

Implemented:

- DHCP Server role
- DHCP Scope
- DNS options
- Dynamic IP assignment
- Client lease verification

Documentation:

- [DHCP](docs/dhcp.md)

---

## Phase 7 – Active Directory Certificate Services (AD CS)

Implemented:

- Installed Active Directory Certificate Services
- Configured an Enterprise Root Certification Authority
- Configured Certificate Auto-Enrollment
- Published certificate templates
- Issued computer certificates to domain-joined clients
- Verified certificate enrollment using CertUtil

### Troubleshooting Highlights

During implementation, the default **Computer** certificate template was not available to CLIENT01.

Troubleshooting included:

- Verifying domain connectivity
- Verifying Enterprise CA configuration
- Testing CA connectivity
- Reviewing certificate template permissions
- Manual certificate enrollment testing
- Diagnosing certificate template issues using CertUtil

The issue was resolved by duplicating the default **Computer** template, publishing it as a new **Workstation Computer** template, and successfully enrolling CLIENT01 with a computer certificate.

Documentation:

- [Active Directory Certificate Services](docs/ad-cs.md)

---
## Phase 8 – Windows Server Update Services (WSUS)

Implemented centralized Windows Update management using Windows Server Update Services.

Configured:

- WSUS Server Role
- Windows Internal Database (WID)
- Dedicated update storage (D:\WSUS)
- Microsoft Update synchronization
- Products and classifications
- Computer groups
- Client-side targeting
- Group Policy integration
- Windows Update client reporting

Verified:

- Successful synchronization with Microsoft Update
- CLIENT01 reporting to WSUS
- Automatic assignment to the Workstations computer group
- Successful client status reporting through WSUS

Documentation:


- [Windows Server Update Services (WSUS)](docs/wsus.md)
---
## Phase 9 – Windows Server Backup

Implemented:

- Installed Windows Server Backup
- Configured dedicated backup storage
- Performed a Full Server Backup
- Configured scheduled daily backups
- Verified backup completion
- Tested file recovery
- Reviewed System State recovery

Documentation:

- [Windows Server Backup](docs/windows-server-backup.md)

---
## Phase 10 – DFS Namespace

Implemented:

- Installed DFS Namespaces
- Created a Domain-based DFS Namespace
- Added departmental folder targets
- Verified namespace access from CLIENT01
- Validated existing NTFS and share permissions through the namespace

Documentation:

- [DFS Namespace](docs/dfs-namespace.md)

---

# Skills Demonstrated

Throughout this lab, the following enterprise technologies were implemented and configured:

### Identity & Access Management

- Active Directory Domain Services
- Organizational Units
- User Management
- Security Groups
- Domain Administration

### Group Policy

- Security Policies
- Administrative Templates
- Password Policies
- Account Lockout Policies
- Group Policy Preferences

### Networking

- DNS
- DHCP
- Domain Name Resolution
- Dynamic Address Assignment

### File Services

- NTFS Permissions
- SMB File Shares
- Departmental File Access
- Drive Mapping

### Public Key Infrastructure (PKI)

- Active Directory Certificate Services
- Enterprise Root Certification Authority
- Certificate Templates
- Certificate Auto-Enrollment
- Certificate Troubleshooting

### Backup & Disaster Recovery

- Windows Server Backup
- Full Server Backups
- Scheduled Backups
- File Recovery
- System State Recovery
- Disaster Recovery Planning

### Windows Server Update Services (WSUS)

- WSUS Installation and Configuration
- Microsoft Update Synchronization
- Products and Classifications
- Computer Groups
- Client-side Targeting
- Windows Update Group Policy
- Windows Update Client Reporting
- Enterprise Patch Management

### Enterprise File Services

- Distributed File System (DFS)
- Domain-based Namespaces
- Namespace Management
- Folder Targets
- Centralized File Access

### Windows Administration

- Server Roles and Features
- Computer Management
- MMC Consoles
- Group Policy Management
- Active Directory Users and Computers
- Certification Authority
- Certificate Templates Console
- Windows Server Update Services Console
- Windows Server Backup

### Troubleshooting

- Group Policy troubleshooting
- Certificate enrollment diagnostics
- CertUtil
- Network connectivity verification
- Active Directory diagnostics
- WSUS client registration
- Client-side targeting
- Windows Update policy troubleshooting
- WSUS synchronization
- Backup verification
- File recovery testing
- Backup scheduling


---

# Technologies Used

- Windows Server 2025
- Windows 11 Pro
- Oracle VirtualBox
- Active Directory Domain Services
- DNS
- DHCP
- Group Policy
- Active Directory Certificate Services
- SMB
- NTFS
- PowerShell
- Command Prompt
- CertUtil
- MMC
- Windows Server Update Services (WSUS)
- Enterprise Patch Management
- Windows Server Backup
- Backup and Disaster Recovery

---

# Future Enhancements

Planned additions to the lab include:

- Windows Deployment Services (WDS)
- DFS Namespace & Replication
- Print Server
- Network Policy Server (NPS)
- Active Directory Federation Services (AD FS)
- Windows Admin Center
- PowerShell automation
- Monitoring and Event Logging

---

# Learning Outcome

This project provided practical experience deploying and managing an enterprise Windows Server environment from the ground up.

The completed lab demonstrates enterprise identity management, Group Policy administration, networking services, centralized file services, Public Key Infrastructure (PKI), Windows Server Update Services (WSUS), backup and disaster recovery, and enterprise troubleshooting. Together, these technologies closely reflect the responsibilities of a Windows Server or Systems Administrator in a production environment.