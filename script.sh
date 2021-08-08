#!/bin/bash
case $1 in
  ansible)
    docker build -t ansible ansible/
    docker run -v $PWD/ansible/Ansible/:/volumes/Ansible -i ansible:latest
    echo "ansible container is ready"
    ;;
  terraform)
    docker build -t terraform terraform/
    docker run -v $PWD/terraform/infrastructure/:/volumes/infrastructure -i terraform:latest
    echo terraform "container is ready"
    ;;
  *)
    echo dont know, use terraform or ansible
    ;;
esac
