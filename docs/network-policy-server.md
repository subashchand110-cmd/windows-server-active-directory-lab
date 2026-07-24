# Network Policy Server (NPS)

## Overview

This phase implements **Network Policy Server (NPS)** to provide centralized authentication, authorization, and accounting (AAA) services using the RADIUS protocol.

NPS integrates with Active Directory to authenticate users and enforce network access policies for services such as VPNs, wireless networks (802.1X), and network switches.

---

# Objectives

- Install the Network Policy Server role
- Register NPS in Active Directory
- Create a RADIUS Client
- Configure a Connection Request Policy
- Configure a Network Policy
- Understand the RADIUS authentication process
- Simulate an enterprise NPS deployment

---

# Lab Environment

| Component | Details |
|----------|---------|
| Server | SERVER2025-DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | mydomain.com |
| Hypervisor | Oracle VirtualBox |
| Simulated RADIUS Client | VPN-Server (192.168.1.20) |

---

# Installing Network Policy Server

The Network Policy Server role was installed using PowerShell.

Command:

```powershell
Install-WindowsFeature NPAS -IncludeManagementTools
```

After installation, the NPS console was available through:

```
Server Manager
→ Tools
→ Network Policy Server
```

---

# Registering NPS in Active Directory

The NPS server was registered in Active Directory to allow it to authenticate domain users.

Navigation:

```
Network Policy Server
→ Right-click NPS (Local)
→ Register server in Active Directory
```

This grants NPS permission to read Active Directory user and group information during authentication requests.

---

# Creating a RADIUS Client

A simulated VPN server was configured as a RADIUS client.

Configuration:

| Setting | Value |
|---------|-------|
| Friendly Name | VPN-Server |
| IP Address | 192.168.1.20 |
| Authentication | Manual Shared Secret |

The shared secret is used to establish trust between the RADIUS client and the NPS server.

---

# Creating a Connection Request Policy

A Connection Request Policy was created to define how authentication requests from the simulated VPN server are processed.

Configuration:

| Setting | Value |
|---------|-------|
| Policy Name | Corporate VPN Requests |
| Condition | Client Friendly Name = VPN-Server |
| Processing | Authenticate requests on this server |

This policy instructs NPS to process authentication requests locally.

---

# Creating a Network Policy

A Network Policy was created to control which users are authorized to access the network.

Configuration:

| Setting | Value |
|---------|-------|
| Policy Name | Domain Users VPN Access |
| Condition | Windows Group = Domain Users |
| Permission | Access Granted |
| Authentication | Microsoft CHAP v2 (MS-CHAP v2) |

Only users who are members of the **Domain Users** group are permitted by this policy.

---

# Authentication Flow

A typical authentication request follows this process:

```
User
   │
   ▼
VPN Server / Wireless Access Point
   │
RADIUS Request
   ▼
Network Policy Server
   │
Active Directory
   │
Authentication & Authorization
   ▼
Access Granted / Access Denied
```

NPS evaluates:

- The RADIUS client
- Connection Request Policy
- Network Policy
- Active Directory group membership

before returning an authentication decision.

---

# Home Lab Considerations

This lab does not include enterprise networking equipment such as a VPN server, wireless controller, or 802.1X-capable switch.

To demonstrate NPS administration, a simulated RADIUS client and authentication policies were configured. In a production environment, these policies would process authentication requests from network devices that support the RADIUS protocol.

---

# Verification

The following tasks were successfully completed:

- Installed Network Policy Server
- Registered NPS in Active Directory
- Created a simulated RADIUS Client
- Configured a Connection Request Policy
- Configured a Network Policy
- Verified NPS configuration through the management console

---

# Benefits of Network Policy Server

Network Policy Server enables administrators to:

- Centralize network authentication
- Integrate authentication with Active Directory
- Control access through security groups
- Support VPN authentication
- Support 802.1X wired and wireless authentication
- Enforce enterprise network access policies

---

# Lessons Learned

During this phase I learned how to:

- Install Network Policy Server
- Register NPS in Active Directory
- Configure RADIUS clients
- Create Connection Request Policies
- Create Network Policies
- Understand enterprise authentication workflows
- Integrate NPS with Active Directory

---

# Skills Demonstrated

- Network Policy Server (NPS)
- RADIUS Authentication
- Active Directory Integration
- Connection Request Policies
- Network Policies
- Authentication and Authorization
- Windows Server Administration