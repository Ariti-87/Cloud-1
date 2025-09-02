# ☁️ Cloud-1

## 📝 Overview

Inspired by the subject [Inception](./inception/README.md), the goal of this project is to deploy a **fully automated WordPress site** and its necessary Docker infrastructure on a cloud provider instance.

Key points:

* **1 process = 1 container**; you cannot simply deploy the same images from Inception.
* Automation is mandatory; suggested tool: **Ansible**.
* Services include **WordPress**, **PhpMyAdmin**, and a **database**.
* Persistent storage, secure access, and restart-after-reboot capabilities are required.
* Site can be deployed on multiple servers in parallel.

## 📚 Documentation / References

* [Xavki - Ansible playlist](https://www.youtube.com/watch?v=kzmvwc2q_z0&list=PLn6POgpklwWoCpLKOSw3mXCqbRocnhrh-)
* [Ansible official docs](https://docs.ansible.com/ansible/latest/getting_started/index.html)

## 🖥️ VM Environment Configuration

For local testing or dev:

1. Create a Virtual Machine (VM).
2. Add **2 network interfaces**:

   * Host-only network
   * NAT network
3. Ensure both interfaces have IP addresses. If not, use:

```sh
sudo dhclient enp0sX
```

or edit `/etc/network/interfaces`:

```txt
auto enp0sX
iface enp0sX inet dhcp
```

4. Install **SSH** and configure your user key:

```sh
ssh-copy-id user@ip
```

5. (Optional) For root login, modify `/etc/ssh/sshd_config`:

```
PermitRootLogin yes
```

Then reset to `prohibit-password` after adding the key.

## ⚙️ How to Use

1. Clone repository:

```sh
git clone https://github.com/Ariti-87/Cloud-1.git
```

2. Copy `.env` template to `/roles/inception/templates/env` and configure:

```txt
DOMAIN_NAME={{ ansible_host }}
CERTS_=/etc/nginx/ssl/inception.crt

SQL_DATABASE=inception_db
SQL_ROOT_PASSWORD=
SQL_USER=
SQL_PASSWORD=

WP_TITLE=inception_wp
WP_ADMIN_USER=
WP_ADMIN_PASSWORD=
WP_ADMIN_EMAIL=
WP_USER_LOGIN=
WP_USER_EMAIL=
WP_USER_PASSWORD=

PMA_HOST=mariadb
PMA_PORT=3306
PMA_ABSOLUTE_URI=https://{{ ansible_host }}/phpmyadmin/
```

4. Launch deployment:

```sh
ansible-playbook playbooks/cloud_1.yml
```

5. Cleanup if needed:

```sh
ansible-playbook playbooks/clean_cloud-1.yml
```

## ✅ Summary

This project provides:

* Fully automated deployment of **WordPress + MariaDB + PhpMyAdmin**.
* Secure, persistent, and scalable infrastructure.
* Playbooks and roles to manage lifecycle, configuration, and cleanup.
