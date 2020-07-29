FROM centos:7
COPY aws-rds-crunchy-data-postgresql-9-stig-baseline/ /share/aws-rds-crunchy-data-postgresql-9-stig-baseline/
COPY pgstigcheck-inspec/ /share/pgstigcheck-inspec/
COPY inspec.sh /share/inspec.sh
RUN yum install -y curl postgresql-client
RUN yum install -y python3 
RUN curl 'https://packages.chef.io/files/stable/inspec/4.22.1/el/7/inspec-4.22.1-1.el7.x86_64.rpm' -o /tmp/inspec-4.22.1-1.el7.x86_64.rpm
RUN yum localinstall --nogpgcheck -y /tmp/inspec-4.22.1-1.el7.x86_64.rpm
RUN curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o "awscliv2.zip" && unzip awscliv2.zip && sudo ./aws/install
RUN yum install -y curl postgresql-client unzip 
RUN yum install -y python3 
RUN yum install -y inspec
ENTRYPOINT ["sh"]
CMD []
