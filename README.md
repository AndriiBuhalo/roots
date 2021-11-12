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
    GEM DOTENV - helps us load environment variables from .env to `ENV` in * development, and add .env for .gitignore. This is necessary to protect our data.
    You need copy .env.local.template and add it's to your .env.local in roots directory

    DATABASE_URL="postgres://postgres:MyPassword@localhost:5432"

    use ENV variable "DATABASE_URL" 

    which you create in the .env.local file in the root directory and add this file for .gitignore file 

    DATABASE_URL="postgres://postgres:MyPassword@localhost:5432"

    where postgres - it's 'username' in your database.yml file
            MyPassword - it's 'password' in your database.yml file
            localhost - it's 'localhost' in your database.yml file
            5432 - it's 'port' in your database.yml file



