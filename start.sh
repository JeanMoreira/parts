# install gem
bundle check || bundle install
# run server
bundle exec puma -C config/puma.rb

#bundle exec rdebug-ide --host 0.0.0.0 --port 3000 -- bin/rackup --host 0.0.0.0 -p 4567