# Jazzify

**Note**: Project being redeveloped in Rails 6. Check the [production branch](https://github.com/SeanLF/jazzfest/tree/production) for the code currently running [jazzify.ca](https://jazzify.ca).

## Getting Started

* Ruby version
  * `cat .ruby-version`

* System dependencies for macOS 10.15
  * Postgres.app
  * homebrew
    * rbenv
      * `brew install rbenv`
      * `rbenv init`
      * `echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc`
      * `rbenv install 2.7.1`
      * `rbenv global 2.7.1`
      * `gem install bundler`
      * `gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config`
      * `bundle install`
      * `rbenv rehash`
    * yarn
      * `brew install yarn`
    * mkcerts
      * `brew install mkcerts nss`
      * `mkcert -install`

* Configuration
  * Obtain `./config/master.key`
  * `rake yarn:install`
  * `mkdir ./config/local_certs/`
  * `mkcert localhost localhost.jazzify.ca 127.0.0.1 ::1`
  * `mv localhost* ./config/local_certs/`

* Database creation
  * `rails db:create`

* Database initialization
  * `rails db:migrate`
  * `rails db:seed`

* How to run the test suite
  * `rake spec`

* Services (job queues, cache servers, search engines, etc.)
  * `brakeman`
  * `bundle exec database_consistency`

### Running Jazzify

* Running Jazzify
  * `rails s`
  * Head over to [https://localhost.jazzify.ca:9292/](https://localhost.jazzify.ca:9292/).

## Deployment

### Provider

I suggest using [Heroku](https://www.heroku.com) or [Dokku](http://dokku.viewdocs.io/dokku/).
I use Digital Ocean + Dokku.

#### Environment variables

Check which environment variables need to be set. The list will be compiled and included here soon.

### Connecting to PostgreSQL with a RDB client

If running macOS, I highly suggest [Postico](https://eggerapps.at/postico/). You shouldn't have much trouble connecting to localhost. You can also find the PostgreSQL login information from the connection string from your production or staging environments.