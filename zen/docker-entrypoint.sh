#!/bin/sh

yarn install --check-files --ignore-optional --ignore-platform --cache-folder /opt/.yarn-cache
export PATH="$PATH:`yarn global bin`"

exec "$@"
