ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG BUILD_VERSION

LABEL \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.version="${BUILD_VERSION}"

RUN apk add --no-cache \
    ruby \
    ruby-dev \
    ruby-bundler \
    task \
    tzdata \
    build-base \
    git

WORKDIR /app

# Fetch the Taskwarrior Web source
RUN git clone \
    --branch v1.3.0 \
    https://github.com/casualuminary/taskwarrior-web.git \
    /app/taskwarrior-web

WORKDIR /app/taskwarrior-web

# Install Ruby dependencies
RUN bundle install

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]