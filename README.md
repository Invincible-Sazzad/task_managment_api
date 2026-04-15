# Task Management App

This is the backend of the Task Management App in Docker environment.

For running this app, first copy `.env-example` to `.env` and set the variable values.

Than, run the following commands:

Build: `docker compose build`

Container Startup: `docker compose up -d`

rail container execution: `docker exec -it task_app bash`

Inside the rails app container, create DB & run migration: `bin/rails db:create db:migrate`

DB container execution: `docker exec -it task_db bash`

Access the app at: http://localhost:9001
