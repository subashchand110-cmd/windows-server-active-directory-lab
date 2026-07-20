# Group Policy Lab

## Objective

Learn how Group Policy Objects (GPOs) are created, linked, and applied in an Active Directory environment.

---

# Lab Environment

| Component | Value |
|-----------|-------|
| Domain | mydomain.com |
| Domain Controller | SERVER2025-DC01 |
| Client | CLIENT01 |
| Test User | john.smith |

---

# Exercise 1 - Desktop Wallpaper Policy

## Create the GPO

Created a new Group Policy Object:

```
Workstations - Desktop Wallpaper
```

Linked the GPO to the:

```
Workstations
```

Organizational Unit.

---

## Configure Wallpaper

Wallpaper file copied to:

```
C:\Windows\SYSVOL\sysvol\mydomain.com\Wallpaper\company-wallpaper.jpg
```

Configured the following policy:

```
User Configuration
 └── Policies
     └── Administrative Templates
         └── Desktop
             └── Desktop
                 └── Desktop Wallpaper
```

Wallpaper path:

```
\\mydomain.com\SYSVOL\mydomain.com\Wallpaper\company-wallpaper.jpg
```

Wallpaper Style:

```
Fill
```

---

# Testing

Logged in as:

```
MYDOMAIN\john.smith
```

Forced Group Policy update:

```cmd
gpupdate /force
```

Generated Resultant Set of Policy (RSoP):

```cmd
gpresult /r
```

Verified the wallpaper image was accessible:

```cmd
dir "\\mydomain.com\SYSVOL\mydomain.com\Wallpaper"
```

---

# Results

The wallpaper image was successfully accessible from the client.

However, the wallpaper policy was **not applied**.

`gpresult /r` reported:

```
Applied Group Policy Objects

N/A
```

---

# Root Cause

The GPO contains a **User Configuration** policy but was linked to the **Workstations** Organizational Unit.

The user account:

```
john.smith
```

is located in:

```
Employee Accounts
```

User Configuration policies are processed based on the **user object's OU**, not the computer's OU.

Since no User GPOs were linked to the **Employee Accounts** OU, no domain user policies were applied.

---

# Key Learning

Group Policy processing depends on the policy type.

### Computer Configuration

- Applies to computer objects
- Evaluated from the computer's Organizational Unit

### User Configuration

- Applies to user objects
- Evaluated from the user's Organizational Unit

This explains why linking a User Configuration policy to the Workstations OU did not affect `john.smith`.

---

# Next Steps

Create a new User GPO linked to the **Employee Accounts** OU to apply the desktop wallpaper successfully.

Later in the lab, explore **Group Policy Loopback Processing**, which allows User Configuration settings to be applied based on the computer's Organizational Unit.