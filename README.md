# Sample RAILS API application

Steps are necessary to get the application up and running.

## Ruby version

- 3.2.2

## Rails version

- 7.1.1

## System dependencies

- [factory_bot_rails](https://rubygems.org/gems/factory_bot_rails)
- [faker](https://rubygems.org/gems/faker)
- [figaro](https://rubygems.org/gems/figaro)
- [lograge](https://rubygems.org/gems/lograge)
- [pry-byebug](https://rubygems.org/gems/pry-byebug)
- [rspec-rails](https://rubygems.org/gems/rspec-rails)
- [rubocop](https://rubygems.org/gems/rubocop)
- ...

## Configuration

```bash
cp config/application.sample.yml config/application.yml 
```

## Database creation

```bash
rails db:create 
```

## Database initialization

```bash
rails db:migrate
```

## Start server

```bash
rails s
```

## How to run the test suite

```bash
rspec . 
```

## Services (job queues, cache servers, search engines, etc.)

```bash
TBD 
```

## Deployment instructions

```bash
TBD 
```

## ...
