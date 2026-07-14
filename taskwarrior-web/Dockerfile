FROM ruby:2.7

# Install Taskwarrior and build dependencies
RUN apt-get update && apt-get install -y \
    taskwarrior \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy Gem definitions first to leverage Docker layer caching
COPY Gemfile Gemfile.lock* ./

# Install Ruby gems
RUN bundle install

# Copy the application
COPY . .

# Expose the default web port
EXPOSE 9292

# Start the application
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "9292"]
