FROM amazonlinux:latest
COPY aws-rds-crunchy-data-postgresql-9-stig-baseline/ /share/aws-rds-crunchy-data-postgresql-9-stig-baseline/
COPY pgstigcheck-inspec/ /share/pgstigcheck-inspec/
COPY inspec.sh /share/inspec.sh
RUN amazon-linux-extras install curl postgresql-client
RUN amazon-linux-extras install python3 
RUN amazon-linux-extras install inspec
ENTRYPOINT ["sh"]
CMD []
