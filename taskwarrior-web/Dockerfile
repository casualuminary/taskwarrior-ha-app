FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    libssl-dev \
    zlib1g-dev \
    libreadline-dev \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    libffi-dev \
    libncurses5-dev \
    pkg-config

#
# Build Ruby 2.3
#
WORKDIR /tmp

RUN wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.gz && \
    tar xzf ruby-2.3.8.tar.gz && \
    cd ruby-2.3.8 && \
    ./configure && \
    make -j$(nproc) && \
    make install


#
# Build Taskwarrior 2.5.1
#
WORKDIR /tmp

RUN git clone --branch v2.5.1 https://github.com/GothenburgBitFactory/taskwarrior.git && \
    cd taskwarrior && \
    cmake -DCMAKE_BUILD_TYPE=release . && \
    make -j$(nproc) && \
    make install


#
# Install taskwarrior-web compatible gem
#
RUN gem install taskwarrior-web -v 1.1.12


COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
