# Beertime (CervezaYa)

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Installation

Requirements:

* NodeJs 0.10+ [How to install](https://nodejs.org/download/)
* Ruby 2.2.0 [How to install](https://gorails.com/setup/osx/10.10-yosemite)
* PostgreSQL 9+ [How to install](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/)
* PostGIS

Install global dependencies:

    gem install bundler
    npm install -g bower phantomjs

Install project dependencies:

    bundle install --without production

Finally, **duplicate `.env.sample` file to `.env`** and edit with your options:

    DEVISE_KEY=secret

## Usage

First time execute:

    bundle exec rake db:create
    bundle exec rake db:migrate

To run application:

    bundle exec rails server

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
