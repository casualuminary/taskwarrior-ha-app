FROM ruby:2.4

RUN apt-get update && apt-get install -y \
    taskwarrior \
    build-essential \
    git \
 && rm -rf /var/lib/apt/lists/*

# Install Taskwarrior 2.5.1 from release source archive
RUN wget -O taskwarrior.tar.gz \
    https://github.com/GothenburgBitFactory/taskwarrior/archive/refs/tags/v2.5.1.tar.gz \
    && tar xzf taskwarrior.tar.gz \
    && cd taskwarrior-2.5.1 \
    && mkdir build \
    && cd build \
    && cmake .. -DENABLE_SYNC=OFF \
    && make -j$(nproc) \
    && make install \
    && cd / \
    && rm -rf taskwarrior*

# Old Ruby tooling required by taskwarrior-web
RUN gem install bundler -v 1.17.3

RUN gem install multi_json -v 1.15.0

RUN gem install taskwarrior-web -v 1.1.12

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 5678

CMD ["/run.sh"]
