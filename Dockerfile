FROM centos:7
COPY aws-rds-crunchy-data-postgresql-9-stig-baseline/ /share/aws-rds-crunchy-data-postgresql-9-stig-baseline/
COPY pgstigcheck-inspec/ /share/pgstigcheck-inspec/
COPY inspec.sh /share/inspec.sh
COPY postgres_session.rb /share/aws-rds-crunchy-data-postgresql-9-stig-baseline/libraries/postgres_session.rb
COPY postgres_session.rb /share/pgstigcheck-inspec/libraries/postgres_session.rb
COPY inspec.yml /share/aws-rds-crunchy-data-postgresql-9-stig-baseline/inspec.yml
COPY inspec.j2 /share/inputs.j2
COPY run-inspec.yml /share/run-inspec.yml
RUN yum install -y curl postgresql unzip python3 epel-release
RUN yum update -y
RUN yum install -y ansible git 
RUN curl 'https://packages.chef.io/files/stable/inspec/4.22.1/el/7/inspec-4.22.1-1.el7.x86_64.rpm' -o /tmp/inspec.rpm
RUN yum localinstall --nogpgcheck -y /tmp/inspec.rpm
RUN curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
ENTRYPOINT ["sh"]
CMD []
