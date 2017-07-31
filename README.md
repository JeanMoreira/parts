# parts
  Stock controle system and parts

# Getting Started

# Build your containers

  docker-compose build

# Install all dependences

 docker-compose run --rm website bundle install

# Create database

  docker-compose run --rm website bundle exec rake db:create

# Create tables

  docker-compose run --rm website bundle exec rake db:migrate

# Run

  docker-compose up


# seed

  docker-compose run --rm website bundle exec rake db:seed

# Recriar db

docker-compose run --rm website bundle exec rake db:drop db:create db:migrate db:seed
