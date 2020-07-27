FROM aws/codebuild/amazonlinux2-x86_64-standard:3.0
COPY aws-rds-crunchy-data-postgresql-9-stig-baseline/ /share/aws-rds-crunchy-data-postgresql-9-stig-baseline/
COPY pgstigcheck-inspec/ /share/pgstigcheck-inspec/
COPY inspec.sh /share/inspec.sh
RUN yum install -y curl postgresql-client
RUN yum install -y python3 
RUN yum install -y inspec
ENTRYPOINT ["sh"]
CMD []
