FROM ruby:2.3.8

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    cmake \
    uuid-dev \
    libgnutls28-dev \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libyaml-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Verify Ruby and OpenSSL from the base image
RUN which ruby
RUN ruby -v
RUN ruby -ropenssl -e "puts OpenSSL::OPENSSL_VERSION"

# Build Taskwarrior 2.5.1 without sync support
RUN git clone https://github.com/GothenburgBitFactory/taskwarrior.git \
    && cd taskwarrior \
    && git checkout v2.5.1 \
    && cmake . -DENABLE_SYNC=OFF \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf taskwarrior

# Install required gems
RUN gem install bundler -v 1.17.3 --no-document
RUN gem install multi_json -v 1.15.0 --no-document
RUN gem install taskwarrior-web -v 1.1.12 --no-document

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 5678

CMD ["/run.sh"]
