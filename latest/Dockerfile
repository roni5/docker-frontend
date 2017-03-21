FROM mhart/alpine-node:7

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="docker-gulp" \
  org.label-schema.description="Skilld base frontend image Alpine - npm, gulp, bower & libsass" \
  org.label-schema.vcs-url="https://github.com/skilld-labs/docker-frontend" \
  maintainer="Andy Postnikov <andypost@ya.ru>"

VOLUME /work
WORKDIR /work

RUN apk add --no-cache make g++ python \
  && npm install -g \
  gulp \
  gulp-sass \
  && apk del --purge make g++ python

COPY docker-entrypoint.sh /usr/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["gulp"]
