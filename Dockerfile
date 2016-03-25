FROM mhart/alpine-node

MAINTAINER Andy Postnikov

ENV RUBY_VERSION 1.9.3-p551
ENV PATH /root/.rbenv/bin:$PATH

#RUN npm install gulp -g

COPY patches/* /root/

RUN apk add --no-cache \
  libstdc++ tzdata bash \
  git gcc g++ make \
  openssl-dev readline-dev zlib-dev linux-headers \
  && git clone https://github.com/rbenv/rbenv.git /root/.rbenv

RUN cd /root/.rbenv && src/configure && make -C src \
  && git clone https://github.com/rbenv/ruby-build.git plugins/ruby-build \
  && cd plugins/ruby-build \
  && patch -p1 < /root/ruby-build.patch && cd ../.. \
  && plugins/ruby-build/install.sh && rm -rf plugins/ruby-build

RUN git clone git://github.com/tpope/rbenv-aliases.git plugins/rbenv-aliases \
  && RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install -p ${RUBY_VERSION} < /root/ruby-193.patch


VOLUME /work
WORKDIR /work
