FROM ruby:3.1.2-alpine3.16 AS bundles

RUN apk add --no-cache --update build-base mariadb-dev gcompat

WORKDIR /app
ADD Gemfile* /app/

ENV BUNDLER_VERSION='2.3.7'
RUN gem install bundler --no-document -v $BUNDLER_VERSION && \
    bundle install

FROM ruby:3.1.2-alpine3.16 AS app

RUN apk add --no-cache --update tzdata mariadb-dev less gcompat

WORKDIR /app
EXPOSE 3000
ENV TZ Asia/Seoul
ENV MALLOC_ARENA_MAX=2

COPY --from=bundles /root/.bundle /root/.bundle
COPY --from=bundles /usr/local/bundle /usr/local/bundle

ADD . /app/
