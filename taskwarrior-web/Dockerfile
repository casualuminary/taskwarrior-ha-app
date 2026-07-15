FROM ruby:3.3.6-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        taskwarrior \
        tzdata \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone \
    --branch v1.3.0 \
    --depth 1 \
    https://github.com/casualuminary/taskwarrior-web.git \
    /app/taskwarrior-web

WORKDIR /app/taskwarrior-web

RUN bundle install

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
