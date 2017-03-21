#!/bin/sh

# prevent conflicts with existing
rm -rf node_modules

/usr/bin/npm link $NPM_PACKAGES

exec "$@"
