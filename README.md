# Project

[centuries-points-tracker.herokuapp.com/](https://centuries-points-tracker.herokuapp.com/)

## Install

### Clone the repository

```shell
git clone https://github.com/pburslemjr/centuries-points-tracker.git
cd centuries-points-tracker
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
sudo apt-get install libpq-dev
gem install bundler
bundler install
```

### Initialize the database

```shell
bundler exec rails db:create RAILS_ENV=test --trace
bundler exec rails db:migrate RAILS_ENV=test --trace
bundler exec rails db:seed RAILS_ENV=test --trace
```

## Run tests
```shell
bundler exec rspec .
bundler exec brakeman -o brakeman.txt
bundler exec rubocop --out rubocop.txt
```

## Serve

```shell
rails s
```

## CI/CD and GitHub Actions
When implementing a feature, create a pull request and merge to main. Upon merging to main, the GitHub actions will run a series of automated building and testing of code.
Merging to the Dev branch will automatically deploy the newly written code to the test website. Merging to the main branch will automatically deploy the newly written code to the production website.
