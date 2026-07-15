FROM alpine:3.22
# Install base packages
RUN apk add --no-cache \
    ruby \
    ruby-dev \
    ruby-bundler \
    git \
    task \
    tzdata \
    build-base

WORKDIR /app

RUN git clone \
    --branch v1.3.0 \
    https://github.com/casualuminary/taskwarrior-web.git \
    /app/taskwarrior-web

WORKDIR /app/taskwarrior-web

RUN bundle install

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
