# File Server & NTFS Permissions

## Overview

This phase of the lab demonstrates how to configure a Windows Server as a file server by creating departmental shares, applying NTFS permissions based on Active Directory security groups, and publishing folders using SMB shares.

---

## Objectives

- Create a dedicated data volume for shared files
- Create department folders
- Configure NTFS permissions
- Configure SMB shares
- Implement Role-Based Access Control (RBAC)
- Verify file shares using PowerShell

---

## Environment

| Component | Value |
|----------|-------|
| Server | SERVER2025-DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | mydomain.com |
| Data Drive | D:\ |
| Shared Folder Root | D:\Shares |

---

## Folder Structure

```
D:\
└── Shares
    ├── HR
    ├── Finance
    ├── Sales
    ├── IT
    └── Public
```

---

## Active Directory Security Groups

The following security groups were used to secure departmental folders.

| Folder | Security Group |
|---------|----------------|
| HR | Human Resources |
| Finance | Finance |
| Sales | Sales |
| IT | IT Support |
| Public | Domain Users |

---

## NTFS Permissions

Permission inheritance was disabled on each departmental folder.

Default inherited permissions were removed while retaining:

- SYSTEM
- Administrators
- CREATOR OWNER

Department security groups were granted **Modify** permissions.

### Example

| Principal | Permission |
|-----------|------------|
| SYSTEM | Full Control |
| Administrators | Full Control |
| CREATOR OWNER | Full Control (Subfolders and Files Only) |
| Human Resources | Modify |

---

## SMB Shares

Each departmental folder was shared using Advanced Sharing.

### Share Configuration

| Share | Path |
|--------|------|
| HR | D:\Shares\HR |
| Finance | D:\Shares\Finance |
| Sales | D:\Shares\Sales |
| IT | D:\Shares\IT |
| Public | D:\Shares\Public |

### Share Permissions

Authenticated Users were granted **Full Control**.

Access control is enforced through NTFS permissions.

---

## Verification

PowerShell was used to verify all SMB shares.

```powershell
Get-SmbShare
```

Example output:

```text
Finance
HR
IT
Public
Sales
```

Administrative shares such as `ADMIN$`, `C$`, `D$`, `NETLOGON`, and `SYSVOL` were also present.

---

## Screenshots

Include screenshots of:

- D:\Shares folder structure
- HR NTFS Security tab
- Advanced Sharing configuration
- Get-SmbShare PowerShell output

---

## Skills Demonstrated

- Windows File Server Administration
- NTFS Permissions
- SMB Shares
- Active Directory Security Groups
- Role-Based Access Control (RBAC)
- PowerShell Administration

## Access Verification

Network access was tested from the Windows 11 domain-joined client (`CLIENT01`).

### Validation Performed

- Successfully connected to the file server using SMB.
- Verified users could access only their assigned departmental share.
- Confirmed unauthorized access was denied.
- Created and modified a test file within the authorized share.
- Verified NTFS permissions correctly enforced Role-Based Access Control (RBAC).

### Result

The file server successfully enforced access based on Active Directory security group membership while allowing all authenticated users to discover available SMB shares.