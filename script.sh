#!/bin/bash
case $1 in
  ansible)
    docker build -t ansible ansible/
    docker run -v $PWD/ansible/Ansible/:/volumes/Ansible -i ansible:latest
    echo "ansible container is ready"
    ;;
  terraform)
    echo stoping
    ;;
  *)
    echo dont know
    ;;
esac
