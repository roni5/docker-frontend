FROM mhart/alpine-node

MAINTAINER Andy Postnikov

RUN apk add --no-cache \
  libstdc++ tzdata bash \
  git gcc g++ make \
  openssl-dev readline-dev zlib-dev

RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv \
  && cd /usr/local/rbenv && src/configure && make -C src

RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build

ENV PATH /usr/local/rbenv/bin:$PATH
RUN /usr/local/rbenv/plugins/ruby-build/install.sh

RUN rbenv install 2.1.8

#RUN apk del git gcc g++ make
RUN rm -rf /tmp/*

#RUN npm install gulp -g

#RUN gem install bundler --no-ri --no-rdoc

VOLUME /work
WORKDIR /work
