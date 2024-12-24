# EvolvAI ReadMe

# How to run
- `rails s`

Things you may want to cover:

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Frameworks 

- ruby 3.3.6 
- rails 8.0.1 
- psql 14.15
- html.slim 3.0
- sass

# Auto compile sass to css
- `./sass-css.sh`
- if new sass file is created add a new line to `sass-css.sh`, example:
- `sass --watch app/assets/stylesheets/new.sass:app/assets/stylesheets/new.css`
