# Digibank demo

[![Code
Climate](https://codeclimate.com/github/pedrosmmoreira/digibankdemo/badges/gpa.svg)](https://codeclimate.com/github/pedrosmmoreira/digibankdemo)
[![Test
Coverage](https://codeclimate.com/github/pedrosmmoreira/digibankdemo/badges/coverage.svg)](https://codeclimate.com/github/pedrosmmoreira/digibankdemo)
[![Circle
CI](https://circleci.com/gh/pedrosmmoreira/digibankdemo/tree/master.svg?style=svg)](https://circleci.com/gh/pedrosmmoreira/digibankdemo/tree/master)

Digibank is a Rails 4.2.1 app, running on Ruby 2.2.2 and deployed to Heroku.

A simple exercise in modelling a bank.

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

This command will also seed the development db with two users and their 
respective accounts.

To create a User with an account via the console, run `bundle exec rails c` and
use the following command:

```
RegistrationForm.new(name: "user name", email: "user email", password: "user_password")
```

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production
