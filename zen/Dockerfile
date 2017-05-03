FROM skilldlabs/frontend:latest

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="zen-frontend-env" \
  org.label-schema.description="Zen theme for Drupal - npm, gulp, bower & libsass" \
  org.label-schema.vcs-url="https://github.com/skilld-labs/docker-frontend" \
  maintainer="Andy Postnikov <andypost@ya.ru>"

ENV NPM_PACKAGES "bower \
  breakpoint-sass \
  browser-sync \
  chroma-sass \
  del \
  eslint \
  event-stream \
  gulp-autoprefixer \
  gulp-cached \
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
  glob \
  sass-lint \
  support-for \
  typey \
  zen-grids"

RUN apk add --no-cache git \
  && npm install -g $NPM_PACKAGES

COPY docker-entrypoint.sh /usr/bin/
