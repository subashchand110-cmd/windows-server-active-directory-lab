# Drive Mapping with Group Policy Preferences

## Overview

This phase automates the mapping of network drives using Group Policy Preferences (GPP). Drive mappings are assigned dynamically based on Active Directory security group membership using Item-Level Targeting.

---

## Objectives

- Create a Group Policy Object for drive mapping
- Automatically map network drives
- Configure Item-Level Targeting
- Map drives based on security group membership
- Verify drive mappings from a Windows 11 client

---

## GPO

**Name**

Employee - Drive Mapping

Location:

User Configuration
→ Preferences
→ Windows Settings
→ Drive Maps

---

## Drive Mappings

| Drive | Share | Security Group |
|--------|-------|----------------|
| P: | \\SERVER2025-DC01\Public | Domain Users |
| H: | \\SERVER2025-DC01\HR | Human Resources |
| F: | \\SERVER2025-DC01\Finance | Finance |
| S: | \\SERVER2025-DC01\Sales | Sales |
| I: | \\SERVER2025-DC01\IT | IT Support |

---

## Configuration

Each drive mapping used:

- Action: Update
- Reconnect: Enabled
- Item-Level Targeting: Enabled

Department drives were targeted using the corresponding Active Directory security group.

---

## Verification

From CLIENT01:

- Updated Group Policy using:

```cmd
gpupdate /force
```

- Signed out and back in.
- Verified the Public drive mapped for all users.
- Verified only the department-specific drive mapped based on the user's security group.

## Skills Demonstrated

- Group Policy Preferences
- Drive Mapping
- Item-Level Targeting
- Active Directory Security Groups
- Windows File Services