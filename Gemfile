source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.1'

# Front end libraries
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'select2-rails'
gem 'country_select'
gem 'slim-rails'

# Activer record components
gem 'pg'
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_import' , '2.1.2'
gem 'active_model_serializers', '0.9.3'
gem 'devise'
gem 'bcrypt', '~> 3.1.7'
gem 'dalli'

# Utilities
gem 'versionist'
gem 'dotenv-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'geokit-rails', github: 'geokit/geokit-rails'
gem 'gcm'
gem 'whenever', :require => false

group :development, :test do
  gem 'spring'
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'capistrano-bower'
end

group :production do
  gem 'puma'
  gem 'newrelic_rpm'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end
