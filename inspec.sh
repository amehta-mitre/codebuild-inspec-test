#!/bin/sh

echo "setting outfile"
OUTFILE="/share/output/$(date -u +%Y%m%d%H%M%S).json"

echo "dont really know what this does"
[ ! -d /share/output ] && mkdir /share/output

echo "getting ca bundle"
wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem

#export RDSHOST="rdspostgres.abcdefghijk.us-west-2.rds.amazonaws.com"
echo $RDSHOST
echo "export pass"
#export PGHOST = $RDSHOST
#export PGPASSWORD="$(aws rds generate-db-auth-token --hostname=$RDSHOST --port=$PGPORT --username=$PGUSER --region=$REGION)"
export PGPASSWORD="password"
echo "pwd"
pwd
echo "password:"
echo $PGPASSWORD

echo "psql with sslcert"
echo 'psql -h $PGHOST -p $PGPORT "dbname=$PGDATABASE user=$PGUSER sslrootcert=/share/rds-combined-ca-bundle.pem sslmode=verify-ca"'
psql -h $PGHOST -p $PGPORT "dbname=$PGDATABASE user=$PGUSER sslrootcert=/share/rds-combined-ca-bundle.pem sslmode=verify-ca"
echo "ls"
ls
inspec exec /share/aws-rds-crunchy-data-postgresql-9-stig-baseline --attrs /share/aws-rds-crunchy-data-postgresql-9-stig-baseline/attributes.yaml --reporter cli json:/share/output/$OUTFILE
echo "vault"
vault --version
echo "aws s3 upload"
aws s3 cp /share/output/$OUTFILE s3://$S3_BUCKET