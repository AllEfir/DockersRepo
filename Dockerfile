FROM amazonlinux 

RUN yum -y update; yum clean all
RUN amazon-linux-extras install ansible2

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"\
 && unzip awscliv2.zip\
 && ./aws/install

RUN yum install -y nano git 

ENV ANSIBLE_INVENTORY=/etc/ansible/hosts 
ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV ANSIBLE_INTERPRETER_PYTHON=auto_silent

RUN echo -e '#!/bin/bash\necho ansible "$@"' > /usr/bin/ans && \chmod +x /usr/bin/ans

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
EXPOSE 80
