#!/bin/sh

# prevent conflicts with existing
rm -rf node_modules

/usr/bin/npm link gulp gulp-sass $NPM_PACKAGES

exec "$@"
