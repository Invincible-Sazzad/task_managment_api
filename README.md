# Task Management App

This is the backend of the Task Management App in Docker environment.

For running this app, first copy `.env-example` to `.env` and set the variable values.

Than, run the following commands:

Build: `docker compose build`

Container Startup: `docker compose up -d`

Rails app container execution: `docker compose exec task_app bash`

Inside the rails app container:
 - create a Rails secret key using `rails secret` command and set it to DEVISE_JWT_SECRET_KEY of the .env file.
 - create DB, run migration & seed the user: `rails db:create db:migrate db:seed`

DB container execution: `docker compose exec task_db bash`

Access the app at: http://localhost:9001


## Note:

Authentication is implemented using REST endpoints via Devise for security and simplicity, while all business logic APIs are exposed via GraphQL.