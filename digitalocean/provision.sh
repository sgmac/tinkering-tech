#!/bin/bash 

# Install dependencies
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible git-core  -y --force-yes


# Create roles and git clone
cat <<EOF>/root/.ansible.cfg
[defaults]
roles_path = /tmp/ansible-roles
host_key_checking=False
EOF

cd /tmp && git clone https://github.com/sgmac/ansible-roles

# Create playbook and run it
cat <<EOF>/tmp/bootstrap.yml
---
- hosts: localhost
  roles:
    - {role: ansible-user, hashed_password: '\$1\$1234\$FqpZluKYwk4TEkBE1InBI.'}
    - {role: ansible-ssh, allow_users: deploy git,  password_authentication: 'yes'}
    - {role: ansible-go, version: 1.6.1, user: deploy}
EOF


cd /tmp && ansible-playbook bootstrap.yml
