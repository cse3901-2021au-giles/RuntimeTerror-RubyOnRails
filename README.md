# RuntimeTerror-RubyOnRails

Jack Garry, Matthew Hu, Kevin Wang, Luke Wilcox

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

## Getting started 
To get started with the app, first make sure you have ruby version '2.6.6' installed by running:
```
$ruby -v
```
If version '2.6.6' is not installed, run:
```
rbenv install 2.6.6
```

Then, clone the rep and then install the needed gems:
```
$ bundle install --without production
```

Next, migrate the database:
```
$ rails db:migrate
```

Run the test suite to verify everything is working correctly:
```
$ rails test
```

If the suite passes, you can run the app in a local server:
```
$ rails server
```