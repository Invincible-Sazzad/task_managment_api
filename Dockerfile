FROM ruby:3.4.1

# Set working directory
WORKDIR /task_app

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  default-libmysqlclient-dev \
  nodejs \
  yarn \
  default-mysql-client \
  vim \
  && rm -rf /var/lib/apt/lists/*

# Install bundler
RUN gem install bundler

# Copy Gemfile and install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the entire app
COPY . .

# Expose the port the app will run on
EXPOSE 9001
