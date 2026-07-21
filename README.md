# Windows Server Active Directory Lab

A hands-on Windows Server 2025 Active Directory home lab built in Oracle VirtualBox to gain practical experience with enterprise Windows Server administration.

---

## Lab Environment

| Component | Details |
|----------|---------|
| Hypervisor | Oracle VirtualBox |
| Host OS | Windows 11 |
| Server OS | Windows Server 2025 Standard Evaluation |
| Client OS | Windows 11 Pro |
| Domain | mydomain.com |

---

## Lab Topology

```
                    Internet
                        │
                Windows 11 Host
                        │
                Oracle VirtualBox
                        │
        ┌───────────────────────────┐
        │                           │
SERVER2025-DC01              CLIENT01
Domain Controller            Windows 11 Pro
AD DS / DNS                  Domain Joined
File Server
```

---

# Completed Phases

##  Phase 1 – Active Directory Infrastructure

### Completed

- Installed Windows Server 2025
- Promoted server to Domain Controller
- Configured Active Directory Domain Services (AD DS)
- Configured DNS
- Created Organizational Units (OUs)
- Created users and security groups
- Joined Windows 11 client to the domain
- Verified domain authentication

### Skills Demonstrated

- Active Directory Administration
- DNS Configuration
- User & Group Management
- Domain Join
- Organizational Unit Management

---

##  Phase 2 – Domain Management

### Completed

- Created administrative and standard user accounts
- Organized users into departmental OUs
- Created departmental security groups
- Verified authentication and group membership
- Tested DNS functionality
- Verified client connectivity

### Skills Demonstrated

- Active Directory Users and Computers
- Security Groups
- OU Administration
- Domain Authentication
- Windows Networking

---

##  Phase 3 – Group Policy

### Completed

Implemented multiple Group Policy Objects (GPOs):

- Desktop Wallpaper Deployment
- Disable Control Panel
- Disable Command Prompt
- Interactive Logon Message
- Password Policy
- Account Lockout Policy

### Skills Demonstrated

- Group Policy Management
- User Configuration
- Computer Configuration
- Password Policies
- Account Lockout Policies
- SYSVOL Management
- Group Policy Processing
- gpupdate
- gpresult

---

##  Phase 4 – File Server

### Completed

- Added dedicated data volume (D:)
- Created departmental folders
- Configured NTFS permissions
- Implemented Role-Based Access Control (RBAC)
- Created SMB shares
- Verified SMB shares using PowerShell

### Folder Structure

```
D:\
└── Shares
    ├── HR
    ├── Finance
    ├── Sales
    ├── IT
    └── Public
```

### Technologies

- NTFS Permissions
- SMB File Sharing
- Windows File Server
- PowerShell (`Get-SmbShare`)
- Active Directory Security Groups

---

# Documentation

Detailed documentation for each phase is available in the **docs** directory.

| Document | Description |
|----------|-------------|
| `active-directory.md` | Active Directory configuration |
| `network.md` | Network configuration |
| `group-policy.md` | Group Policy configuration |
| `file-server.md` | File Server, NTFS permissions and SMB shares |

---

# Screenshots

The repository includes screenshots demonstrating:

- Active Directory Users and Computers
- DNS Manager
- Group Policy Management
- Windows Security Policies
- File Server Configuration
- NTFS Permissions
- SMB Shares
- PowerShell Verification

---

# Technologies Used

- Windows Server 2025
- Windows 11 Pro
- Active Directory Domain Services (AD DS)
- DNS
- Group Policy
- NTFS Permissions
- SMB File Sharing
- PowerShell
- Oracle VirtualBox

---

# Future Enhancements

- Drive Mapping using Group Policy Preferences
- Folder Redirection
- DFS Namespace
- File Server Resource Manager (FSRM)
- Roaming Profiles
- Windows Server Backup
- DHCP Server
- WSUS
- Certificate Services (AD CS)
- Remote Desktop Services
- Windows Admin Center

---

# Learning Outcomes

This lab demonstrates practical experience with:

- Windows Server Administration
- Active Directory
- Group Policy
- Identity & Access Management (IAM)
- Role-Based Access Control (RBAC)
- File Server Administration
- PowerShell Administration
- Enterprise Windows Infrastructure