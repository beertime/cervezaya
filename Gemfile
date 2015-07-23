source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.1'

# Front end libraries
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'select2-rails'
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
gem 'country_select'
gem 'versionist'
gem 'dotenv-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'geokit-rails', github: 'geokit/geokit-rails'

group :development, :test do
  gem 'thin'
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'capistrano-bower'
  gem 'capistrano-passenger'
end

group :production do
  gem 'newrelic_rpm'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end
