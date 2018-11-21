#!/bin/sh
ansible-playbook deploy.yml -i hosts -u polar --private-key ~/.ssh/id_rsa
