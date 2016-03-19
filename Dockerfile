FROM mhart/alpine-node

MAINTAINER Andy Postnikov

ENV RUBY_VERSION 2.1.8
ENV PATH /usr/local/rbenv/bin:$PATH

RUN npm install gulp -g

RUN apk add --no-cache \
  libstdc++ tzdata bash \
  git gcc g++ make \
  openssl-dev readline-dev zlib-dev \
  && git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv \
  && cd /usr/local/rbenv && src/configure && make -C src \
  && git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build \
  && git clone git://github.com/tpope/rbenv-aliases.git /usr/local/rbenv/plugins/rbenv-aliases \
  && /usr/local/rbenv/plugins/ruby-build/install.sh \
  && rbenv install ${RUBY_VERSION} \
  && rbenv global ${RUBY_VERSION} \
  && ln -s $(rbenv which ruby) /usr/local/bin/ruby \
  && ln -s $(rbenv which gem) /usr/local/bin/gem \
  && gem install bundler compass scss_lint --no-ri --no-rdoc \
  && ln -s $(rbenv which bundle) /usr/local/bin/bundle \
  && ln -s $(rbenv which compass) /usr/local/bin/compass \
  && ln -s $(rbenv which scss-lint) /usr/local/bin/scss-lint \
  && apk del git gcc g++ make \
  openssl-dev readline-dev zlib-dev \
  && rm -rf /tmp/*

VOLUME /work
WORKDIR /work
