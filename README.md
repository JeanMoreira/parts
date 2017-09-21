# install docker 
  https://docs.docker.com/docker-for-windows/install/

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

# Gerar erd do banco 

docker-compose run --rm website bundle exec


# Generat policy 

rails g pundit:policy post
 
git link https://github.com/elabs/pundit

# Gerar migration junto ao paperclip
docker-compose run --rm website bundle exec rails generate paperclip part picture

docker-compose run --rm website bundle exec rake paperclip:refresh CLASS= Part


#tasks

docker-compose run --rm website bundle exec rake dev:generate_ads
