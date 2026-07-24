# Windows Server Update Services (WSUS)

## Overview

Windows Server Update Services (WSUS) enables administrators to centrally manage, approve, and deploy Microsoft updates to computers within an Active Directory environment. Instead of each client downloading updates directly from Microsoft, domain-joined computers obtain approved updates from an internal WSUS server.

In this lab, WSUS was deployed on Windows Server 2025 and integrated with Active Directory using Group Policy. A Windows 11 client was configured to receive updates from the WSUS server and assigned automatically to a computer group using Client-side Targeting.

---

# Objectives

- Install the Windows Server Update Services role.
- Configure WSUS using Windows Internal Database (WID).
- Store update content on a dedicated data volume.
- Synchronize updates from Microsoft Update.
- Configure Products and Classifications.
- Create WSUS computer groups.
- Configure Group Policy for WSUS.
- Enable Client-side Targeting.
- Register a Windows 11 client with WSUS.
- Approve updates for deployment.
- Verify successful client reporting.

---

# Lab Environment

| Component | Configuration |
|-----------|---------------|
| Hypervisor | Oracle VirtualBox |
| Host OS | Windows 11 |
| Domain Controller | SERVER2025-DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | mydomain.com |
| Client | CLIENT01 |
| Client OS | Windows 11 Enterprise Evaluation |
| WSUS Content Directory | D:\WSUS |
| WSUS Port | xxxx |

---

# Installing WSUS

Server Manager

```
Add Roles and Features
```

Installed components:

- Windows Server Update Services
- WSUS Services
- WID Connectivity
- WSUS Tools

Configured WSUS content location:

```
D:\WSUS
```

Completed post-installation:

```powershell
wsusutil.exe postinstall CONTENT_DIR=D:\WSUS
```

Post-installation completed successfully.

---

# Initial Configuration

Configured WSUS using:

- Microsoft Update
- No Proxy Server
- Manual Synchronization

Selected Products:

- Windows 11
- Microsoft Server Operating System – 24H2

Selected Classifications:

- Critical Updates
- Security Updates
- Updates
- Definition Updates

Completed the initial synchronization successfully.

---

# Computer Groups

Created the following WSUS computer group:

```
Workstations
```

Client-side Targeting was used instead of manually assigning computers.

---

# Group Policy Configuration

Created a new Group Policy Object:

```
WSUS - Windows Updates
```

Configured the following policies:

## Specify intranet Microsoft update service location

```
http://SERVER2025-DC01:* * *
```

Configured for both:

- Update Detection
- Statistics Server

---

## Configure Automatic Updates

Enabled

Configured:

```
Auto download and schedule install
```

---

## Enable Client-side Targeting

Enabled

Target Group:

```
Workstations
```

---

## Do not connect to Windows Update Internet locations

Enabled

---

# Applying Group Policy

On CLIENT01:

```powershell
gpupdate /force
```

Verified using:

```powershell
gpresult /r
```

Confirmed:

```
WSUS - Windows Updates
```

was successfully applied.

---

# Client Registration

Verified registry settings:

```text
HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate
```

Confirmed:

```
WUServer
WUStatusServer
TargetGroup
TargetGroupEnabled
```

were correctly configured.

Forced update detection using:

```cmd
UsoClient RefreshSettings
UsoClient StartScan
```

CLIENT01 successfully registered with WSUS.

---

# Verification

Verified:

- CLIENT01 appeared in the Workstations computer group.
- Client-side Targeting worked correctly.
- Last Status Report populated successfully.
- Installed/Not Applicable updates displayed.
- Client successfully communicated with WSUS.

---

# Troubleshooting

## Initial Synchronization

Issue:

```
HTTP Error
```

Cause:

The WSUS server did not have Internet connectivity.

Resolution:

Added a second VirtualBox NAT adapter.

Verified connectivity:

```powershell
Test-NetConnection download.windowsupdate.com -Port * * *
```

Result:

```
TcpTestSucceeded : True
```

---

## Client Appeared in Unassigned Computers

Issue:

CLIENT01 initially appeared under:

```
Unassigned Computers
```

Cause:

WSUS was configured to:

```
Use the Update Services console to move computers
```

instead of Client-side Targeting.

Resolution:

Changed WSUS configuration to:

```
Use Group Policy or registry settings on computers
```

Configured Client-side Targeting in Group Policy.

CLIENT01 automatically moved into the Workstations group after reporting.

---

## Domain Controller Registered as a Workstation

Issue:

SERVER2025-DC01 appeared in the Workstations group.

Cause:

The WSUS Group Policy Object was linked at the domain level.

Resolution:

Removed the GPO link from the domain and linked it only to the Workstations OU.

This ensured only workstation computers received the WSUS policy.

---

# Skills Demonstrated

- Windows Server Update Services (WSUS)
- Microsoft Update Synchronization
- Products and Classifications
- Computer Groups
- Client-side Targeting
- Group Policy Administration
- Windows Update Configuration
- Enterprise Patch Management
- Windows Update Troubleshooting
- Active Directory Integration

---

# Commands Used

```powershell
wsusutil.exe postinstall CONTENT_DIR=D:\WSUS

gpupdate /force

gpresult /r

reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate

UsoClient RefreshSettings

UsoClient StartScan

Test-NetConnection download.windowsupdate.com -Port * * *
```

---

# Lessons Learned

- WSUS requires Internet connectivity for Microsoft Update synchronization.
- Products and Classifications determine which updates are synchronized.
- Client-side Targeting simplifies WSUS administration.
- Group Policy is the preferred method for configuring Windows Update clients in Active Directory.
- Linking WSUS policies only to the appropriate Organizational Unit prevents unintended computers from registering with incorrect WSUS computer groups.

---

# Outcome

Successfully deployed Windows Server Update Services (WSUS) within an Active Directory environment.

The Windows Server 2025 WSUS server synchronized updates from Microsoft Update, distributed Windows Update configuration through Group Policy, automatically assigned domain-joined computers to WSUS computer groups using Client-side Targeting, and successfully managed update reporting for Windows 11 clients.

This phase demonstrates enterprise patch management using centralized Windows Update Services integrated with Active Directory.