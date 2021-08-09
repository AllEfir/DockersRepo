#!/bin/bash
echo "Enter the name of the container(ansible or terraform): "
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
        ansible)
                echo " ansible container be is ready"
                docker build -t ansible ansible/
                docker run -v $PWD/ansible/Ansible/:/volumes/Ansible -i ansible:latest
                echo " ansible container now is ready"
                break
                ;;
        terraform)
                echo " terraform container be is ready"
                docker build -t terraform terraform/
                docker run -v $PWD/terraform/infrastructure/:/volumes/infrastructure
                echo " terraform container now is ready"
                break
                ;;
        *)
                echo "Sorry, I don't understand"
                ;;
  esac
done
echo 
echo "Goodbye"

