# Windows Server Backup

## Overview

This phase implements **Windows Server Backup** to provide backup and recovery capabilities for the Windows Server environment.

Windows Server Backup enables administrators to protect critical server components, including the operating system, Active Directory, installed roles, and application data. It provides recovery options for files, folders, System State, and complete server restoration.

---

# Objectives

- Install Windows Server Backup
- Configure dedicated backup storage
- Perform a Full Server Backup
- Configure scheduled backups
- Test file recovery
- Understand System State recovery
- Verify successful backup operations

---

# Lab Environment

| Component | Details |
|----------|---------|
| Server | SERVER2025-DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | mydomain.com |
| Backup Storage | E:\ (Backup Volume) |
| Hypervisor | Oracle VirtualBox |

---

# Installing Windows Server Backup

Windows Server Backup was installed through **Server Manager**.

Navigation:

```
Manage
→ Add Roles and Features
→ Features
→ Windows Server Backup
```

After installation, the backup console was opened from:

```
Server Manager
→ Tools
→ Windows Server Backup
```

---

# Backup Storage Configuration

To follow backup best practices, a third virtual hard disk was added to the virtual machine using Oracle VirtualBox.

The disk was:

- Initialized as GPT
- Formatted as NTFS
- Assigned drive letter **E:**
- Labeled **Backup**

Using a dedicated backup volume separates backup data from the operating system and application data.

---

# Full Server Backup

A one-time **Full Server Backup** was created using the Windows Server Backup Wizard.

Configuration:

| Setting | Value |
|---------|-------|
| Backup Type | Full Server |
| Destination | Local Drive (E:) |
| Backup Mode | Backup Once |

The backup included:

- Operating System
- Active Directory Domain Services
- DNS
- DHCP
- SYSVOL
- Registry
- Boot Files
- Installed Server Roles
- File Server Data
- Windows Server Update Services (WSUS)
- Active Directory Certificate Services (AD CS)

The backup completed successfully without errors.

---

# Scheduled Backup

To automate protection of the server, a scheduled backup was configured.

Configuration:

| Setting | Value |
|---------|-------|
| Backup Type | Full Server |
| Schedule | Daily |
| Destination | E:\ Backup Volume |

This ensures that server backups are performed automatically without manual intervention.

---

# File Recovery Test

To verify backup integrity, a file recovery test was performed.

Steps:

1. Created a test file.
2. Included the file in a backup.
3. Deleted the file.
4. Opened the **Recover** wizard.
5. Restored the deleted file.
6. Verified the recovered file opened successfully.

This confirmed that Windows Server Backup can successfully recover deleted files from a backup.

---

# System State Recovery

System State recovery was explored to understand recovery options for critical server components.

System State includes:

- Active Directory database (NTDS)
- SYSVOL
- Windows Registry
- Boot files
- COM+ Class Registration Database
- Protected system files

System State recovery provides the ability to restore essential Windows Server components without performing a complete server restore, making it an important disaster recovery feature for Domain Controllers.

---

# Verification

The following tasks were successfully completed:

- Installed Windows Server Backup
- Configured dedicated backup storage
- Performed a Full Server Backup
- Verified successful backup completion
- Configured scheduled daily backups
- Successfully restored a deleted file
- Reviewed System State recovery options

---

# Benefits of Windows Server Backup

Windows Server Backup enables administrators to:

- Protect critical server data
- Recover deleted files and folders
- Restore Active Directory
- Recover the operating system
- Restore installed server roles
- Support disaster recovery planning
- Automate backup operations

---

# Lessons Learned

During this phase I learned how to:

- Install Windows Server Backup
- Configure dedicated backup storage
- Perform Full Server Backups
- Schedule automatic backups
- Restore deleted files
- Understand System State recovery
- Implement backup and disaster recovery best practices

---

# Skills Demonstrated

- Windows Server Backup
- Full Server Backup
- Scheduled Backups
- File Recovery
- System State Recovery
- Disaster Recovery
- Backup Storage Configuration
- Windows Server Administration