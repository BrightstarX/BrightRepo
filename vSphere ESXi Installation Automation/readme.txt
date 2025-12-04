# ESXi Automated Installation with Ansible

# Author : * Halil Ibrahim Karabacak *

---

# Overview

- This repository contains an automated VMware ESXi installation workflow built using Ansible.
- The automation simplifies and standardizes ESXi host deployments by eliminating manual installation steps, ensuring consistency across enviroments.
- This automation is especially useful for large physical ESXi server enviroments and enterprise-scale hypervisor provisioning.

---

# Reason

#This project generally automates the following tasks:

- Preparing installation variables and host definitions. 
- Automating ESXi installation through scripted deployment.
- Configuring essential system settings end to end.
- Selecting desire language, Mounting and Ejecting desire version of Installation ISO on target server, Configuring ESXi Administrative and Networking settings.
- Ensuring repeatable and reliable provisioning of vSphere ESXi hosts.

# Utilized Technologies

- Ansible Tower
- Redfish API (Depends on server brand, this automation written for Dell servers. It could be change only API according to different brands (HPE, Lenovo, Cisco, Huawei, Kaytus etc.)
- S3 Storage Infrastructre

---
