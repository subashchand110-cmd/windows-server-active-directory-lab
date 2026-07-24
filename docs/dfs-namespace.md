# DFS Namespace

## Overview

This phase implements **Distributed File System (DFS) Namespaces** to provide a centralized and consistent access path for shared folders across the domain.

Rather than accessing shared folders directly from a specific server, users connect through a domain-based namespace. This abstraction allows administrators to change or replace file servers without requiring users to update network paths or drive mappings.

---

# Objectives

- Install DFS Namespaces
- Create a Domain-based DFS Namespace
- Add existing departmental shares as namespace folders
- Verify client access through the namespace
- Understand the purpose of DFS in enterprise environments

---

# Lab Environment

| Component | Details |
|----------|---------|
| Server | SERVER2025-DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | mydomain.com |
| Namespace | Departments |
| Hypervisor | Oracle VirtualBox |

---

# Installing DFS

The DFS role services were installed using Server Manager.

Navigation:

```
Manage
→ Add Roles and Features
→ File and Storage Services
→ File and iSCSI Services
```

Installed role services:

- DFS Namespaces
- DFS Replication

Although DFS Replication was installed, it was not configured because the lab contains a single file server.

---

# Creating a Domain-based Namespace

Using **DFS Management**, a new namespace was created.

Configuration:

| Setting | Value |
|---------|-------|
| Namespace Server | SERVER2025-DC01 |
| Namespace Name | Departments |
| Namespace Type | Domain-based |
| Mode | Windows Server 2008 Mode |

Namespace path:

```
\\mydomain.com\Departments
```

---

# Adding Folder Targets

Existing SMB shares from the File Server phase were added as DFS folder targets.

| DFS Folder | Folder Target |
|------------|---------------|
| HR | \\SERVER2025-DC01\HR |
| Finance | \\SERVER2025-DC01\Finance |
| Sales | \\SERVER2025-DC01\Sales |
| IT | \\SERVER2025-DC01\IT |
| Public | \\SERVER2025-DC01\Public |

This allows users to access departmental shares through the namespace instead of connecting directly to the server.

---

# Testing from CLIENT01

The namespace was tested from the domain-joined client.

Test path:

```
\\mydomain.com\Departments
```

Verification:

- Successfully accessed the namespace.
- All departmental folders were visible.
- Existing NTFS and share permissions were enforced.
- Authorized users could access their assigned departmental shares.
- Unauthorized users received Access Denied when attempting to access restricted folders.

---

# DFS Namespace vs Traditional SMB Shares

### Traditional Access

```
\\SERVER2025-DC01\HR
\\SERVER2025-DC01\Finance
\\SERVER2025-DC01\Sales
```

Users must know the name of the file server.

---

### DFS Namespace Access

```
\\mydomain.com\Departments\HR
\\mydomain.com\Departments\Finance
\\mydomain.com\Departments\Sales
```

Users connect through the domain namespace rather than a specific server. If the underlying file server changes in the future, administrators only need to update the DFS folder target while users continue using the same namespace path.

---

# DFS Replication Overview

DFS Replication synchronizes shared folders between multiple file servers.

Typical enterprise benefits include:

- Redundant file servers
- Automatic data replication
- High availability
- Load balancing through multiple namespace targets

This lab uses a single file server, so DFS Replication was not configured. The role service was installed to demonstrate its availability and relationship to DFS Namespaces.

---

# Lessons Learned

During this phase I learned how to:

- Install DFS role services
- Create a Domain-based DFS Namespace
- Add existing shared folders as namespace targets
- Access file shares through a centralized namespace
- Understand how DFS simplifies file server management in enterprise environments

---

# Skills Demonstrated

- Distributed File System (DFS)
- DFS Namespaces
- Domain-based Namespaces
- Namespace Management
- Folder Targets
- Centralized File Access
- Windows Server Administration