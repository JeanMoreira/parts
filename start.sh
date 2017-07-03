# install gem
bundle check || bundle install
# run server
bundle exec puma -C config/puma.rb