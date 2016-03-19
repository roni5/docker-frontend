FROM mhart/alpine-node

MAINTAINER Andy Postnikov

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
  && /usr/local/rbenv/bin/rbenv install 2.1.8 \
  && apk del git gcc g++ make \
  openssl-dev readline-dev zlib-dev \
  && rm -rf /tmp/*

ENV PATH /usr/local/rbenv/bin:$PATH

RUN rbenv global 2.1.8 \
  && ln -s $(rbenv which gem) /usr/local/bin/gem \
  && ln -s $(rbenv which ruby) /usr/local/bin/ruby \
  && gem install bundler scss_lint --no-ri --no-rdoc \
  && ln -s $(rbenv which bundle) /usr/local/bin/bundle \
  && ln -s $(rbenv which scss-lint) /usr/local/bin/scss-lint

VOLUME /work
WORKDIR /work
