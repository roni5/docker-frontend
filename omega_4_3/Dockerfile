FROM ruby:2.1-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="omega-7.x-4.3-frontend-env" \
  org.label-schema.description="Ruby 2.1 based env for Omega 7.x-4.3 theme for Drupal" \
  org.label-schema.vcs-url="https://github.com/skilld-labs/docker-frontend" \
  maintainer="Andy Postnikov <andypost@ya.ru>"

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir /usr/app
COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
WORKDIR /usr/app
RUN bundle install

WORKDIR /work

CMD ["compass", "compile", "-e", "production", "-s", "compact"]
