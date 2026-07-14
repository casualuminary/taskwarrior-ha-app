FROM ruby:2.7

# Install Taskwarrior and build dependencies
RUN apt-get update && apt-get install -y \
    taskwarrior \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

RUN gem install multi_json -v 1.15.0
RUN gem install taskwarrior-web

RUN which task-web && task-web --version

# Copy the application
COPY . .

# Expose the default web port
EXPOSE 9292

# Start the application
CMD ["/run.sh"]
