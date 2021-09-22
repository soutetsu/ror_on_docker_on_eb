FROM ruby:2.7.1-alpine

RUN apk update \
      && apk add --no-cache --virtual=.build-deps \
      build-base \
      && apk add --no-cache \
      postgresql-dev \
      tzdata \
      nodejs~=12 \
      yarn

WORKDIR /foo
COPY . /foo
RUN gem install bundler -v 2.1.4
RUN bundle install --without test development
RUN yarn install --check-files --production=true

