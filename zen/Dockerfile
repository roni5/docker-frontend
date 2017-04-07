FROM mhart/alpine-node:7

MAINTAINER Andy Postnikov

VOLUME /work
WORKDIR /work

RUN apk add --no-cache make g++ python git
RUN apk add --no-cache curl && \
  mkdir -p /opt && \
  curl -sL https://yarnpkg.com/latest.tar.gz | tar xz -C /opt && \
  mv /opt/dist /opt/yarn && \
  ln -s /opt/yarn/bin/yarn /usr/local/bin && \
  apk del --purge curl

COPY docker-entrypoint.sh /usr/bin/

RUN cd /opt
ADD https://raw.githubusercontent.com/skilld-labs/zen/8.x-7.x/STARTERKIT/package.json .
RUN yarn config set cache-folder /opt/.yarn-cache
RUN yarn install -g --cache-folder /opt/.yarn-cache
RUN rm package.json



ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["yarn", "run", "gulp"]
