#!/bin/sh

OUTFILE="$(date -u +%Y%m%d%H%M%S).json"

[ ! -d /share/output ] && mkdir /share/output

inspec exec /share/aws-rds-crunchy-data-postgresql-9-stig-baseline --attrs /share/aws-rds-crunchy-data-postgresql-9-stig-baseline/attributes.yaml --reporter cli json:/share/output/$OUTFILE

if [ ! -z "$HEIMDALL_APIURL" ]; then
  curl -F "file=@/share/output/$OUTFILE" -F "email=$HEIMDALL_USER" -F "api_key=$HEIMDALL_APIKEY" -F "circle=$HEIMDALL_CIRCLE" $HEIMDALL_APIURL
fi
