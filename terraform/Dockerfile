FROM amazonlinux

RUN yum -y update; yum clean all
RUN yum install -y nano git tree unzip curl wget tar tar.x86_64 
RUN wget https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
RUN git clone https://github.com/hashicorp/terraform.git
RUN cd terraform && go install 
RUN mv ~/go/bin/terraform  /usr/local/bin/


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"\
 && unzip awscliv2.zip\
 && ./aws/install


RUN echo -e '#!/bin/bash\necho terraform "$@"' > /usr/bin/tfr && \chmod +x /usr/bin/tfr
