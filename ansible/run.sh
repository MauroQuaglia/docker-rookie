#!/usr/bin/env bash

./setup.sh
ansible-playbook playbook.yml --ask-vault-pass -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"'