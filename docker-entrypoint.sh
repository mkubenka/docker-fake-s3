#!/bin/sh

set -eo pipefail

if [ "${1:0:1}" = '-' ]; then
  set -- fakes3 -p "${FAKES3_PORT:-4569}" "$@"
fi

if [ "$1" = 'fakes3' ]; then
  "$@" -q &
  pid="$!"

  sleep 1

  export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
  export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

  aws s3 mb s3://${FAKES3_DEFAULT_BUCKET:-fake} \
    --region ${FAKES3_DEFAULT_REGION:-eu-west-1} \
    --endpoint-url http://localhost:${FAKES3_PORT:-4569}

  if ! kill -s TERM "$pid" || ! wait "$pid"; then
    echo >&2 'Fake S3 init process failed.'
    exit 1
  fi
fi

exec "$@"
