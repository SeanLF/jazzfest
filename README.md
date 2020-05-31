# Jazzify
[![Code Climate](https://codeclimate.com/github/SeanLF/jazzfest/badges/gpa.svg)](https://codeclimate.com/github/SeanLF/jazzfest)

**Note**: Jazzify is being redeveloped in Rails 6 over [here](https://github.com/SeanLF/jazzfest/tree/rails-6-upgrade).

## Getting started

Clone this repository, then ensure that you have the necessary dependencies, and that your local PostgreSQL server is running.

### Dependencies

- [Ruby](https://www.ruby-lang.org/en/)
  - bundler
- [PostgreSQL](http://www.postgresql.org/download/) (macOS apps: [Server](http://postgresapp.com/))

```bash
bundle install
rails db:setup
bundle exec rails server
```

### Running Jazzify

Start your Rails server.
```bash
rails s
```
Then head over to [https://localhost.jazzify.ca:9292/](https://localhost.jazzify.ca:9292/).

### Deployment

#### Provider
I suggest using [Heroku](https://www.heroku.com) or [Dokku](http://dokku.viewdocs.io/dokku/).
I use Digital Ocean + Dokku.

#### Environment variables
Check which environment variables need to be set. The list will be compiled and included here soon.

### Connecting to PostgreSQL with a RDB client

If running macOS, I highly suggest [Postico](https://eggerapps.at/postico/). You shouldn't have much trouble connecting to localhost. You can also find the PostgreSQL login information from the connection string from your production or staging environments.
