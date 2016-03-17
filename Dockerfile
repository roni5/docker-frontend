FROM mhart/alpine-node

MAINTAINER Andy Postnikov

RUN apk add --no-cache ruby ruby-bundler \
  ruby-irb ruby-rake ruby-io-console ruby-bigdecimal \
  libstdc++ tzdata

RUN npm install gulp -g

RUN gem install bundler --no-ri --no-rdoc
