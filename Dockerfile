FROM chef/inspec:3
COPY aws-rds-crunchy-data-postgresql-9-stig-baseline /share/aws-rds-crunchy-data-postgresql-9-stig-baseline
COPY pgstigcheck-inspec /share/pgstigcheck-inspec
COPY inspec.sh /share/inspec.sh
RUN apk add curl postgresql-client
ENTRYPOINT ["sh"]
CMD []
