# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## DATABASE ENV
    GEM DOTENV - helps us load environment variables from .env to `ENV` in * development and add this file for .gitignore. This is necessary to protect our data.
    You need to copy the template from .env.local.template and insert it into .env.local.

    DATABASE_URL="postgres://postgres:postgres@localhost:5432"

    use ENV variable "DATABASE_URL" 

    where postgres - it's 'username' in your database.yml file
        postgres - it's 'password' in your database.yml file
        localhost - it's 'localhost' in your database.yml file
        5432 - it's 'port' in your database.yml file



