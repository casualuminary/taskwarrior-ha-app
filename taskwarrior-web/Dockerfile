FROM ruby:3.3-alpine

RUN apk add --no-cache \
    git \
    task \
    tzdata \
    build-base

WORKDIR /app

RUN git clone \
    --branch v1.3.0 \
    --depth 1 \
    https://github.com/casualuminary/taskwarrior-web.git \
    /app/taskwarrior-web

WORKDIR /app/taskwarrior-web

RUN bundle config set without 'development test' && \
    bundle install

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
