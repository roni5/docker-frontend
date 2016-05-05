FROM mhart/alpine-node

MAINTAINER Andy Postnikov

ENV RUBY_VERSION 2.1.8
ENV PATH /root/.rbenv/bin:$PATH

VOLUME /work
WORKDIR /work


RUN apk add --no-cache libstdc++ tzdata bash git gcc g++ make openssl-dev readline-dev zlib-dev ruby-dev libffi-dev \
 flex gettext

RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv \
  && cd /root/.rbenv && src/configure && make -C src \
  && echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh \
  && echo 'eval "$(rbenv init -)"' >> .bashrc


RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build \
  && git clone git://github.com/tpope/rbenv-aliases.git /root/.rbenv/plugins/rbenv-aliases \
  && git clone git://github.com/jamis/rbenv-gemset.git /root/.rbenv/plugins/rbenv-gemset \
  && git clone git://github.com/carsomyr/rbenv-bundler.git /root/.rbenv/plugins/bundler \
  && /root/.rbenv/plugins/ruby-build/install.sh \
  && ln -s $(rbenv which ruby-build) /root/.rbenv/plugins/ruby-build
  #&& ln -s $(rbenv which alias) /root/.rbenv/plugins/rbenv-aliases \
  #&& ln -s $(rbenv which gemset) /root/.rbenv/plugins/rbenv-gemset

RUN rbenv alias --auto \
  && rbenv install  -k ${RUBY_VERSION} \
  && rbenv global ${RUBY_VERSION} \
  && rbenv rehash \
  && ln -s $(rbenv which ruby) /usr/local/bin/ruby \
  && ln -s $(rbenv which gem) /usr/local/bin/gem \
  && gem install bundler --no-ri --no-rdoc \
  && ln -s $(rbenv which bundler) /usr/local/bin/bundle

#  && apk del git gcc g++ make \
# openssl-dev readline-dev zlib-dev \
#  && rm -rf /tmp/*

