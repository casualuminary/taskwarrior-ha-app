FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/opt/ruby/bin:$PATH"

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    cmake \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libyaml-dev \
    libffi-dev \
    uuid-dev \
    libgnutls28-dev \
    && rm -rf /var/lib/apt/lists/*

# Ruby 2.3.8
RUN curl -O https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.gz \
    && tar xzf ruby-2.3.8.tar.gz \
    && cd ruby-2.3.8 \
    && ./configure \
        --prefix=/opt/ruby \
        --with-openssl-dir=/usr \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf ruby-2.3.8 ruby-2.3.8.tar.gz
RUN ruby -v

# Taskwarrior 2.5.1
RUN git clone https://github.com/GothenburgBitFactory/taskwarrior.git \
    && cd taskwarrior \
    && git checkout v2.5.1 \
    && cmake . \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf taskwarrior

RUN gem install bundler -v 1.17.3

RUN gem install multi_json -v 1.15.0
RUN gem install taskwarrior-web -v 1.1.12

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 5678

CMD ["/run.sh"]
