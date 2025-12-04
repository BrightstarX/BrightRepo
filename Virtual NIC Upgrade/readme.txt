# Zero-Downtime Windows Servers, VMXNET3 Network Interface Adapter Upgrade

This repository provides an automated and zero-downtime workflow for upgrading windows virtual machines from **E1000 / E1000e** network adapters to **VMXNET3** on VMware vSphere environments.

The script ensures that production systems continue running without network interruption by creating a temporary VMXNET3 interface, applying a placeholder IP configuration, and restoring the original IP to the new adapter after validation.

---

# Overview

- Upgrade from E1000/E1000e to VMXNET3**
- No service interruption during migration
- Automatically:
  - Detects the existing NIC and its IP configuration
  - Adds a new VMXNET3 adapter
  - Assigns a temporary dummy IP 
  - Reassigns the original IP to the new VMXNET3 interface
  - Removes the old E1000 adapter after confirmation
- Compatible with PowerCLI, PowerShell

---
