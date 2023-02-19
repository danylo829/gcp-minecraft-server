# GCP Minecraft Server

This repository contains code for deploying a Minecraft server on Google Cloud Platform (GCP) using Terraform for infrastructure provisioning, Ansible for deployment automation, Prometheus+Grafana for monitoring (Logs, CPU/RAM/Network load), and Telepush for alerting.

## Prerequisites

Before deploying the Minecraft server, you will need to have the following tools installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

You will also need to create a Google Cloud Platform (GCP) project and have credentials set up to authenticate with GCP. You can find instructions for setting up GCP credentials [here](https://cloud.google.com/docs/authentication/getting-started).

## Deploying the Minecraft Server

To deploy the Minecraft server, follow these steps:

1. Clone this repository: 
```
git clone https://github.com/danylo829/gcp-minecraft-server
```
2. Navigate to the repository directory: 
```
cd gcp-minecraft-server
```
3. Initialize Terraform: 
```
terraform init
```
4. Create a Terraform plan: 
```
terraform plan -out=tfplan
```
5. Apply the Terraform plan:
```
terraform apply tfplan
```
6. Wait for the infrastructure to be provisioned.
7. Run the Ansible playbook to deploy the Minecraft server: 
```
ansible-playbook ansible/playbook.yml
```

## Monitoring the Minecraft Server

Grafana is configured to monitor the Minecraft server. To access Grafana, navigate to `http://<Monitoring Server IP Address>:3000` in your web browser.

## Alerting with Telepush

Telepush is configured to send alerts when the Minecraft server is down or CPU/RAM load is high. To use Telepush, you will need to set up a [Telegram bot](https://core.telegram.org/bots) and obtain a bot token. Then, enter your token in file `ansible/install_moni/defaults/main.yml` and run `ansible-playbook ansible/playbook.yml` again.

## Configuration

The Minecraft server can be configured by modifying the `ansible/install_minecraft_server/vars/main.yml` file. This file contains variables for configuring the server, such as the server version and name.

## Cleanup
To destroy the Minecraft server infrastructure, run the following command:
```
terraform destroy
```
