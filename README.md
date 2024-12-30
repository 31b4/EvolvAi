# EvolvAI ReadMe

# Run app and db with docker (NOT COMPLETE)
- `docker-compose up --build`
- make sure you have `config/master.key`

# Run only db with docker
- `docker-compose up -d db` - start only the db with compose
- `rails s` - start the webapp
- `bin/rails db:migrate`
- Troubleshoot: 
    - `docker-compose down`, `docker volume rm evolvai_db_data` delete the old volume
    - `bin/rails db:create`


# Run without docker
- `brew services start postgresql@14` start postgre if not running (macOs)
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
- html.slim 5.2
- sass 1.83.0 compiled with dart2js 3.6.0

# Test
- rspec 7.0
- factory bot 
- faker
- database_cleaner
- rails-controller-testing

# Run test
` bundle exec rspec spec`

