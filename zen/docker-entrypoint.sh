#!/bin/sh

# prevent conflicts with existing
rm -rf node_modules

/usr/bin/npm link \
  bower \
  breakpoint-sass \
  browser-sync \
  chroma-sass \
  del \
  eslint \
  event-stream \
  gulp \
  gulp-autoprefixer \
  gulp-eslint \
  gulp-if \
  gulp-load-plugins \
  gulp-rename \
  gulp-replace \
  gulp-sass \
  gulp-sass-lint \
  gulp-size \
  gulp-sourcemaps \
  gulp.spritesmith \
  kss \
  node-sass-import-once \
  sass-lint \
  support-for \
  typey \
  zen-grids

exec "$@"
