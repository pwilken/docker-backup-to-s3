#!/bin/bash

set -e


if [[ -n "$ACCESS_KEY"  &&  -n "$SECRET_KEY" ]]; then
    echo "access_key=$ACCESS_KEY" >> /root/.s3cfg
    echo "secret_key=$SECRET_KEY" >> /root/.s3cfg
else
    echo "No ACCESS_KEY and SECRET_KEY env variable found, assume use of IAM"
    exit 1
fi

echo "Job started: $(date)"

/usr/local/bin/s3cmd sync $PARAMS "$DATA_PATH" "$S3_PATH"

echo "Job finished: $(date)"
