FROM mhart/alpine-node:7

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="node-based-d7-frontend-env" \
  org.label-schema.description="Skilld base frontend image for Drupal7. Alpine - npm, gulp, bower & libsass" \
  org.label-schema.vcs-url="https://github.com/skilld-labs/docker-frontend" \
  maintainer="Andy Postnikov <andypost@ya.ru>"

VOLUME /work
WORKDIR /work

ENV NPM_PACKAGES "node-sass \
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
  glob \
  gulp \
  gulp-concat \
  gulp-eslint \
  gulp-if \
  gulp-sass \
  gulp-sass-lint \
  gulp-sourcemaps \
  gulp-uglify \
  gulp.spritesmith \
  normalize-scss \
  sass-rem \
  sass-toolkit \
  script-loader \
  susy \
  typey \
  yargs \
  node-sass-asset-functions"

RUN apk add --no-cache make g++ git python && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community libsass && \
    npm --unsafe-perm install -g webpack@1 LPGhatguy/node-sass-glob $NPM_PACKAGES && \
     apk del --purge make g++ python git

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["gulp"]
