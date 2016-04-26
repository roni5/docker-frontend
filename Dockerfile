FROM mhart/alpine-node

MAINTAINER Andy Postnikov

ENV RUBY_VERSION 2.1.8
ENV PATH /usr/local/rbenv/bin:$PATH

RUN npm install gulp -g

VOLUME /work
WORKDIR /work

COPY omega_4_4/* /work/omega_4_4/
COPY omega_4_3/* /work/omega_4_3/


RUN apk add --no-cache \
  libstdc++ tzdata bash \
  git gcc g++ make \
  openssl-dev readline-dev zlib-dev \
  && git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv \
  && cd /usr/local/rbenv && src/configure && make -C src \
  && git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build \
  && git clone git://github.com/tpope/rbenv-aliases.git /usr/local/rbenv/plugins/rbenv-aliases \
  && git clone git://github.com/jamis/rbenv-gemset.git /usr/local/rbenv/plugins/rbenv-gemset \
  && /usr/local/rbenv/plugins/ruby-build/install.sh \
  && ln -s $(rbenv which ruby-build) /usr/local/rbenv/plugins/ruby-build \
  && rbenv install ${RUBY_VERSION} \
  && rbenv global ${RUBY_VERSION} \
  && ln -s $(rbenv which ruby) /usr/local/bin/ruby \
  && ln -s $(rbenv which gem) /usr/local/bin/gem \
  && gem install bundler --no-ri --no-rdoc \
  && ln -s $(rbenv which bundle) /usr/local/bin/bundle \
  && cd /work/omega_4_4 \
  && bundle install \
  && ln -s $(rbenv which compass) /usr/local/bin/compass \
  && ln -s $(rbenv which scss-lint) /usr/local/bin/scss-lint \
  && apk del git gcc g++ make \
  openssl-dev readline-dev zlib-dev \
  && rm -rf /tmp/*

#RUN  cd /work/omega_4_3 \
#  && bundle install

# TODO add gemset management
# https://gist.github.com/MicahElliott/2407918#enable-rvm-style-gemsets-optional
