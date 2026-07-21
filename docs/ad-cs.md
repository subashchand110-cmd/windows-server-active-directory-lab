# Phase 7 – Active Directory Certificate Services (AD CS)

## Overview

Active Directory Certificate Services (AD CS) is Microsoft's Public Key Infrastructure (PKI) solution that enables organizations to issue, manage, renew, and revoke digital certificates within an Active Directory environment.

Digital certificates are used to establish trust between users, computers, and services. Rather than purchasing certificates from a public Certificate Authority (CA), organizations can deploy their own internal Enterprise CA to issue trusted certificates for domain-joined devices.

Common use cases include:

- Computer and user authentication
- Secure Remote Desktop (RDP)
- VPN authentication
- Wi-Fi (802.1X) authentication
- HTTPS for internal web servers
- Encrypting File System (EFS)
- Code signing
- Smart card authentication

---

# Objectives

The objectives for this phase were:

- Install Active Directory Certificate Services (AD CS)
- Configure an Enterprise Root Certification Authority (CA)
- Configure Certificate Auto-Enrollment using Group Policy
- Automatically issue computer certificates to domain-joined devices
- Verify certificate enrollment on CLIENT01
- Troubleshoot and resolve certificate enrollment issues

---

# Lab Environment

| Component | Value |
|-----------|-------|
| Domain | mydomain.com |
| Domain Controller | SERVER2025-DC01 |
| Client | CLIENT01 |
| Certificate Authority | MYDOMAIN-ROOTCA |
| CA Type | Enterprise Root CA |

---

# Installing AD CS

The **Active Directory Certificate Services** role was installed using **Server Manager**.

Installed Role Services:

- Certification Authority

During the AD CS Configuration Wizard, the following options were selected:

| Setting | Value |
|---------|------|
| CA Type | Enterprise CA |
| CA Role | Root CA |
| Private Key | Create a new private key |
| Cryptographic Provider | RSA Microsoft Software Key Storage Provider |
| Key Length | 2048-bit |
| Hash Algorithm | SHA256 |
| Common Name | MYDOMAIN-ROOTCA |

After configuration, the Enterprise Root Certification Authority was successfully installed.

> **Screenshot:** AD CS Configuration Wizard

---

# Configuring Certificate Auto-Enrollment

To allow domain computers to automatically receive certificates, Certificate Auto-Enrollment was enabled through Group Policy.

**Path**

```
Computer Configuration
 └── Policies
      └── Windows Settings
           └── Security Settings
                └── Public Key Policies
                     └── Certificate Services Client – Auto-Enrollment
```

Configuration:

- Enabled
- Renew expired certificates
- Update pending certificates
- Remove revoked certificates
- Update certificates using certificate templates

The policy was linked to the domain.

> **Screenshot:** Auto-Enrollment GPO

---

# Initial Testing

On CLIENT01, Group Policy was updated and certificate enrollment was triggered manually.

```powershell
gpupdate /force

certutil -pulse
```

The commands completed successfully.

However, checking the Local Computer Personal certificate store showed that no certificate had been issued.

```powershell
certutil -store My
```

The Personal store was empty.

> **Screenshot:** Empty Personal certificate store

---

# Troubleshooting

Although the AD CS installation completed successfully, CLIENT01 did not automatically receive a computer certificate.

A systematic troubleshooting process was followed to identify the cause.

## 1. Verified Domain Connectivity

Verified that CLIENT01 was correctly joined to the Active Directory domain.

Commands used:

```powershell
whoami

hostname

nltest /dsgetdc:mydomain.com
```

Results:

- Domain joined successfully
- Secure channel operational
- Domain Controller reachable

---

## 2. Verified Enterprise Root CA

Verified the Certificate Authority type.

```powershell
certutil -getreg CA\CAType
```

Result:

```
Enterprise Root CA
```

This confirmed the CA had been configured correctly.

---

## 3. Verified CA Connectivity

Verified communication between CLIENT01 and the Certificate Authority.

```powershell
certutil -config - -ping
```

Result:

```
ICertRequest2 interface is alive
```

This confirmed that the client could successfully communicate with the CA.

---

## 4. Verified Published Certificate Templates

The **Computer** certificate template was confirmed as published in the Certification Authority console.

The template also contained the correct permissions:

| Security Principal | Permissions |
|-------------------|------------|
| Authenticated Users | Read |
| Domain Computers | Read, Enroll |
| Domain Admins | Read, Write, Enroll |
| Enterprise Admins | Read, Write, Enroll |

Despite these settings, CLIENT01 still could not obtain a certificate.

---

## 5. Manual Certificate Enrollment

Manual enrollment was attempted using:

```powershell
certreq -enroll -machine Computer
```

Result:

```
Template not found

CERTSRV_E_NO_CERT_TYPE
```

This indicated that although the Computer template existed, the client was unable to locate or use it for enrollment.

---

# Resolution

Instead of attempting to repair the built-in **Computer** certificate template, a new certificate template was created by duplicating it.

Steps performed:

- Opened Certificate Templates Console (`certtmpl.msc`)
- Duplicated the **Computer** template
- Created a new template named:

```
Workstation Computer
```

Permissions assigned:

- Domain Computers
    - Read
    - Enroll

The new template was then published through the Certification Authority console.

Finally, Group Policy was updated and certificate enrollment was triggered again.

```powershell
gpupdate /force

certutil -pulse
```

---

# Verification

After publishing the new certificate template, CLIENT01 successfully enrolled for a computer certificate.

Verification command:

```powershell
certutil -store My
```

Result:

```
Template:
WorkstationComputer
```

```
DNS Name:
CLIENT01.mydomain.com
```

The certificate appeared in the Local Computer Personal certificate store, confirming successful enrollment.

> **Screenshot:** Successful computer certificate

---

# Skills Demonstrated

Throughout this phase, the following skills were demonstrated:

- Active Directory Certificate Services (AD CS)
- Public Key Infrastructure (PKI)
- Enterprise Root Certification Authority deployment
- Certificate Templates
- Certificate Auto-Enrollment
- Group Policy configuration
- Enterprise certificate management
- CertUtil troubleshooting
- Certificate enrollment diagnostics

---

# Commands Used

```powershell
gpupdate /force

certutil -pulse

certutil -store My

certreq -enroll -machine Computer

certutil -config - -ping

certutil -getreg CA\CAType

whoami

hostname

nltest /dsgetdc:mydomain.com
```

---

# Lessons Learned

During this phase several important concepts about Active Directory Certificate Services were reinforced:

- An Enterprise CA relies on Active Directory certificate templates to issue certificates.
- Certificate Auto-Enrollment requires both Group Policy configuration and an accessible certificate template.
- Successful communication with the Certificate Authority does not guarantee that certificate templates are available for enrollment.
- The `certutil` command-line utility is an essential tool for diagnosing certificate enrollment issues.
- Creating and publishing a duplicate certificate template can resolve situations where the default template is unavailable to client computers.

---

# Outcome

✔ Installed Active Directory Certificate Services

✔ Configured an Enterprise Root Certification Authority

✔ Configured Certificate Auto-Enrollment

✔ Diagnosed certificate enrollment issues

✔ Created and published a custom workstation certificate template

✔ Successfully enrolled CLIENT01 with a computer certificate

✔ Verified certificate installation using CertUtil

This phase introduced enterprise Public Key Infrastructure (PKI) into the lab, enabling secure certificate-based authentication for domain-joined computers and providing the foundation for future services such as HTTPS, VPN authentication, Remote Desktop certificates, and secure wireless authentication.