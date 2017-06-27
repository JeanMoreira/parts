# parts
  Stock controle system and parts

# Getting Started

# Build your containers

  docker-compose build

# Install all dependences

 docker-compose run --rm website bundle install

# Create database

  docker-compose run --rm website bundle exec rake db:create

# Run

  docker-compose up

