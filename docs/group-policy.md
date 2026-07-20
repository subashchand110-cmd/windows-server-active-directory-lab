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

# Exercise 2 - Applying a User GPO Successfully

## Objective

Apply a desktop wallpaper to domain users using Group Policy linked to the correct Organizational Unit.

---

## Create the GPO

Created a new Group Policy Object:

```
Employee Desktop Wallpaper
```

Linked the GPO to:

```
Employee Accounts
```

Organizational Unit.

---

## Configure the Policy

Configured:

```
User Configuration
 └── Policies
     └── Administrative Templates
         └── Desktop
             └── Desktop
                 └── Desktop Wallpaper
```

Settings:

Wallpaper:

```
\\mydomain.com\SYSVOL\mydomain.com\Wallpaper\company-wallpaper.jpg
```

Style:

```
Fill
```

---

## Testing

Logged in as:

```
MYDOMAIN\john.smith
```

Updated Group Policy:

```cmd
gpupdate /force
```

Verified applied policies:

```cmd
gpresult /r
```

Result:

```
Applied Group Policy Objects

Employee Desktop Wallpaper
```

The desktop wallpaper was successfully applied after logging back into the client computer.

---

# Outcome

The wallpaper policy successfully applied because:

- The policy is a **User Configuration** policy.
- The GPO is linked to the **Employee Accounts** OU.
- The user account (`john.smith`) resides in the **Employee Accounts** OU.

---

# Key Learning

User Configuration policies are processed according to the location of the **user object** in Active Directory.

Correct design:

```
Employee Accounts OU
    ├── User Objects
    └── User GPOs
```

Computer Configuration policies should instead be linked to the Organizational Unit containing the computer objects.

---

# Skills Practiced

- Creating Group Policy Objects
- Linking GPOs to Organizational Units
- Configuring User Configuration policies
- Using SYSVOL to distribute shared resources
- Forcing Group Policy updates
- Verifying policy application with `gpresult`
- Troubleshooting GPO processing

# Exercise 3 - Disable Control Panel and Settings

## Objective

Prevent standard domain users from accessing the Windows Control Panel and Settings application using Group Policy.

---

# Create the GPO

Created a new Group Policy Object:

```
Employee - Disable Control Panel
```

Linked the GPO to:

```
Employee Accounts
```

Organizational Unit.

---

# Configure the Policy

Navigated to:

```
User Configuration
 └── Policies
     └── Administrative Templates
         └── Control Panel
```

Enabled the following policy:

```
Prohibit access to Control Panel and PC settings
```

Configuration:

```
Enabled
```

---

# Testing

Logged into:

```
MYDOMAIN\john.smith
```

Updated Group Policy:

```cmd
gpupdate /force
```

Verified applied policies:

```cmd
gpresult /r
```

Confirmed that the following GPOs were applied:

```
Employee Desktop Wallpaper
Employee - Disable Control Panel
```

---

# Verification

Attempted to open:

```
Control Panel
```

Result:

```
Access denied due to Group Policy restrictions.
```

Attempted to open:

```
Windows Settings
```

Result:

```
Access blocked by Group Policy.
```

The restriction successfully prevented the standard user from modifying system settings.

---

# Key Learning

Administrative Templates allow administrators to centrally manage Windows features without modifying local user permissions.

This policy demonstrates how organizations can standardize user environments and prevent unauthorized configuration changes across all domain-joined computers.

---

# Skills Practiced

- Creating User Group Policy Objects
- Linking GPOs to Organizational Units
- Configuring Administrative Template policies
- Updating Group Policy with `gpupdate`
- Verifying applied policies using `gpresult`
- Testing user restrictions in a domain environment


# Exercise 4 - Disable Command Prompt

## Objective

Prevent standard domain users from launching Command Prompt (`cmd.exe`) and executing batch scripts using Group Policy.

---

# Create the GPO

Created a new Group Policy Object:

```
Employee - Disable Command Prompt
```

Linked the GPO to:

```
Employee Accounts
```

Organizational Unit.

---

# Configure the Policy

Navigated to:

```
User Configuration
 └── Policies
     └── Administrative Templates
         └── System
```

Enabled the following policy:

```
Prevent access to the command prompt
```

Configuration:

```
Enabled

Disable the command prompt script processing:
Yes
```

---

# Testing

Logged in as:

```
MYDOMAIN\john.smith
```

Updated Group Policy:

```cmd
gpupdate /force
```

Verified applied policies:

```cmd
gpresult /r
```

---

# Verification

Attempted to launch:

```
cmd.exe
```

Result:

```
The command prompt has been disabled by your administrator.
```

The standard domain user was unable to launch Command Prompt or execute command shell scripts.

---

# Key Learning

Administrative Template policies provide centralized control over Windows features and applications.

Restricting Command Prompt helps reduce unauthorized command-line access and limits the execution of scripts by standard users.

This policy is commonly used in enterprise environments where users have defined roles and limited administrative privileges.

---

# Skills Practiced

- Creating User Group Policy Objects
- Configuring Administrative Template policies
- Applying security restrictions through Group Policy
- Updating Group Policy with `gpupdate`
- Verifying policy enforcement on a domain-joined client

# Exercise 5 - Interactive Logon Message

## Objective

Configure an interactive logon message that is displayed before users can sign in to a domain-joined computer.

---

# Create the GPO

Created a new Group Policy Object:

```
Workstations - Interactive Logon Message
```

Linked the GPO to:

```
Workstations
```

Organizational Unit.

---

# Configure the Policy

Navigated to:

```
Computer Configuration
 └── Policies
     └── Windows Settings
         └── Security Settings
             └── Local Policies
                 └── Security Options
```

Configured the following policies:

### Interactive logon: Message title for users attempting to log on

```
MYDOMAIN Authorized Access
```

### Interactive logon: Message text for users attempting to log on

```
This computer is the property of MYDOMAIN.

Authorized users only.

All activities on this system may be monitored and recorded.

By signing in, you acknowledge that you understand and accept these conditions.
```

---

# Testing

Updated Group Policy:

```cmd
gpupdate /force
```

Restarted CLIENT01.

---

# Verification

Before the Windows sign-in screen appeared, the configured legal notice was displayed.

Users were required to acknowledge the message before entering their credentials.

---

# Key Learning

Interactive logon messages are configured through **Computer Configuration** because they are displayed before user authentication occurs.

Since the GPO was linked to the **Workstations** Organizational Unit, it applied successfully to CLIENT01.

---

# Skills Practiced

- Creating Computer Configuration Group Policy Objects
- Configuring Security Options
- Deploying enterprise logon banners
- Understanding Computer Configuration policy processing
- Verifying Computer GPO application

# Exercise 6 - Password Policy and Account Lockout Policy

## Objective

Configure domain-wide password and account lockout policies to improve the security of Active Directory user accounts.

---

# Edit Default Domain Policy

Opened:

```
Default Domain Policy
```

Navigated to:

```
Computer Configuration
 └── Policies
     └── Windows Settings
         └── Security Settings
             └── Account Policies
```

---

# Password Policy

Configured:

| Policy | Value |
|---------|------:|
| Enforce password history | 5 passwords |
| Maximum password age | 90 days |
| Minimum password age | 1 day |
| Minimum password length | 8 characters |
| Password complexity | Enabled |
| Reversible encryption | Disabled |

---

# Account Lockout Policy

Configured:

| Policy | Value |
|---------|------:|
| Account lockout threshold | 5 attempts |
| Account lockout duration | 15 minutes |
| Reset lockout counter | 15 minutes |

---

# Verification

Updated Group Policy:

```cmd
gpupdate /force
```

Verified policy using:

```cmd
net accounts
```

Confirmed the configured password and lockout settings.

---

# Account Lockout Test

Logged into CLIENT01.

Attempted to sign in using an incorrect password five consecutive times.

Result:

```
User account locked.
```

Unlocked the account using:

```
Active Directory Users and Computers
```

Verified successful login after unlocking.

---

# Key Learning

Password Policy and Account Lockout Policy are domain-wide security settings.

Unlike most Group Policy Objects, these settings are configured within the **Default Domain Policy** and apply across the entire Active Directory domain.

These policies help protect against weak passwords and brute-force authentication attacks.

---

# Skills Practiced

- Managing Default Domain Policy
- Configuring Password Policy
- Configuring Account Lockout Policy
- Verifying domain policies using `net accounts`
- Testing account lockout
- Unlocking user accounts in Active Directory Users and Computers