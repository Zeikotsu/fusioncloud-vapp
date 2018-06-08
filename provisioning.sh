#!/bin/bash
# Script for automaticaly provision middlewares by Ansible

# Install epel repository
yum install -y epel-release

# install Ansible and Git
yum install -y yum-utils ansible git

# copy public key for transparent ssh connection
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

# retrieve the playbook form GitHub
mkdir -p /tmp/provisionning && cd /tmp/provisionning
git clone https://github.com/Zeikotsu/fusioncloud-vapp.git

# Launch the playbook and pray God
cd /tmp/provisionning/fusioncloud-vapp/playbooks
ansible-playbook -i tests/inventory tests/test.yml

# purge sources
rm -Rf /tmp/provisionning
