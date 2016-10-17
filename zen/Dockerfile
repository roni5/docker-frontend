FROM skilldlabs/frontend:latest

MAINTAINER Andy Postnikov

RUN apk add --no-cache git \
  && npm install -g \
  bower \
  breakpoint-sass \
  browser-sync \
  chroma-sass \
  del \
  eslint \
  event-stream \
  gulp-autoprefixer \
  gulp-eslint \
  gulp-if \
  gulp-load-plugins \
  gulp-rename \
  gulp-replace \
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

COPY docker-entrypoint.sh /usr/bin/
