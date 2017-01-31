#!/bin/sh

# prevent conflicts with existing
rm -rf node_modules

/usr/bin/npm link \
    node-sass \
    webpack \
    webpack-dev-server \
    webpack-stream \
    babel-core \
    babel-loader \
    babel-plugin-transform-runtime \
    babel-polyfill \
    babel-preset-es2015 \
    breakpoint-sass \
    chroma-sass \
    compass-importer \
    del \
    eslint \
    gulp \
    glob \
    gulp-concat \
    gulp-eslint \
    gulp-if \
    gulp-sass \
    gulp-sass-lint \
    gulp-sourcemaps \
    gulp-uglify \
    gulp.spritesmith \
    node-sass-glob \
    normalize-scss \
    sass-rem \
    sass-toolkit \
    script-loader \
    susy \
    typey \
    yargs \
    node-sass-asset-functions

exec "$@"
