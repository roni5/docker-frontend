FROM mhart/alpine-node:7

VOLUME /work
WORKDIR /work

RUN apk add --no-cache make g++ git python && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community libsass && \
    npm --unsafe-perm install -g \
        node-sass \
        webpack@1 \
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
        LPGhatguy/node-sass-glob \
        normalize-scss \
        sass-rem \
        sass-toolkit \
        script-loader \
        susy \
        typey \
        yargs \
        node-sass-asset-functions && \
     apk del --purge make g++ python git

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["gulp"]
