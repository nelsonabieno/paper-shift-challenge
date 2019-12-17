source 'https://rubygems.org'

gem 'rails',                          '~> 5.2.1'
gem 'pg',                             '>= 0.18', '< 2.0'
gem 'puma',                           '~> 3.7'
gem 'rack-cors',                      '~> 1.0.2'
gem 'paper_trail',                    '~> 9.0.0'
gem 'active_model_serializers',       '~> 0.10.7'
gem 'dalli',                          '~> 2.7.7'
gem 'sidekiq',                        '~> 5.2.2'

group :development do
  gem 'listen',                       '>= 3.0.5', '< 3.2'
  gem 'dotenv-rails',                 '~> 1.0.2'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end