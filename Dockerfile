# syntax = docker/dockerfile:1
# Use the official Ruby image with version 3.1.0 as base
FROM ruby:3.1.4

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client && npm install -g yarn

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock and install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the rest of the application code
COPY . .

# Install JavaScript dependencies and compile assets
COPY package.json yarn.lock ./
RUN yarn install 

# Expose port 3000 to the Docker host, so it can be accessed from the outside
EXPOSE 3000

# Entrypoint prepares the database.
ENTRYPOINT ["/app/bin/docker-entrypoint"]

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
