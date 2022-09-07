web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq --config config/sidekiq.yml
release: bundle exec rake db:migrate
