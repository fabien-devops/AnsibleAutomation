# 🔧 DevOps Automation with Ansible

This repository contains a collection of Ansible playbooks to automate the deployment, configuration, and cleanup of essential DevOps services on a self-hosted Linux VPS (Debian-based), including:

- 📦 Nexus Repository Manager OSS
- 🌐 Node.js applications
- 🐳 Docker containers (e.g., Nginx)
- 🧹 Clean uninstall scripts for Java, Node, and Nexus

---

## 📁 Project Structure :
ansible/
│
├── nexus-install.yml # Install Nexus Repository Manager
├── nexus-uninstall.yml # Uninstall Nexus and cleanup
├── node-install.yml # Install Node.js and npm
├── node-deploy.yml # Deploy a Node.js application
├── node-uninstall.yml # Uninstall Node.js and cleanup
├── docker-nginx.yml # Deploy an Nginx container via Docker
├── nginx-remove.yml # Stop/remove Nginx (if applicable)
├── my-vars # Variable file for Node app
└── inventory # Inventory file (VPS hosts like kvm4)

---

## 🚀 Features

### ✅ Nexus Deployment
- Downloads and installs Nexus OSS v3.80
- Sets up a dedicated `nexus` system user and permissions
- Starts the service and verifies running status
- Opens port `8081` on UFW for web access

### ✅ Node.js Setup
- Installs Node.js and npm via apt
- Unpacks a `.tgz` Node.js app archive
- Installs dependencies and launches the app asynchronously
- Verifies the app status with process listing

### ✅ Docker & Nginx
- Starts an Nginx container using `community.docker` Ansible collection
- Maps port `8080:80`

### 🧹 Cleanup Playbooks
- Fully remove Nexus, Node.js, Java, and related files/folders
- Ensures a clean, repeatable environment for reinstallation

---

## 🧰 Requirements

- Linux VPS (Debian-based)
- Ansible installed locally
- SSH access to your remote host(s)
- Python and `community.docker` collection (for Docker tasks)

Install the Docker collection:
```bash
ansible-galaxy collection install community.docker
```
⚙️ Usage
1. Clone the repository
git clone https://github.com/fabien-devops/ansible.git
cd ansible

2. Update your inventory
Edit the inventory file to add your VPS host (e.g. kvm4):
[kvm4]
your-vps-ip ansible_user=root

3. Run a playbook
Deploy Nexus:
ansible-playbook -i inventory nexus-install.yml

Uninstall Nexus:
ansible-playbook -i inventory nexus-uninstall.yml

Deploy Node.js app:
ansible-playbook -i inventory node-install.yml
ansible-playbook -i inventory node-deploy.yml

Deploy Nginx container:
ansible-playbook -i inventory docker-nginx.yml

📂 Example: my-vars file (for Node.js app)
version: "1.0.0"
location: "/root/apps"
destination: "/var/www"
Make sure to have a file like: /root/apps/nodejs-app-1.0.0.tgz before deploying the app.

What You’ll Learn / Showcase :

    *Automating infrastructure with Ansible
    *Managing services on remote Linux servers
    *Working with VPS environments
    *Deploying DevOps tools like Nexus and Node.js
    *Using Ansible roles, handlers, and modules
    *Managing Docker containers declaratively
    *Writing clean and reusable IaC scripts

 Author
Fabien Andrianambinintsoa
LinkedIn Profile : www.linkedin.com/in/fabien-andrianambinintsoa
DevOps Engineer | IaC Enthusiast | Open Source Contributor
