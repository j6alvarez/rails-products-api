# Rails products api

## System dependencies

- Ruby 2.7.7
- Rails 6.1.4

## Configuration

Use `rbenv`. See https://github.com/rbenv/rbenv

## Installing

```sh
# Clone the repo
git clone <this repo>

# Install the gems
bundle install

# Create and seed the DB
rake db:create db:migrate db:seed
```

## Running in local

```sh
# Start the dev server
rails s
```

## Test suite

```sh
# Run tests
bundle exec rspec
```