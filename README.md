# RuntimeTerror-RubyOnRails
> Jack Garry, Matthew Hu, Kevin Wang, Luke Wilcox

RuntimeTerror-RubyOnRails is a peer evaluation tool that allows teams to provide feedback for each other.

This project allows admins to create their own courses with unique class codes that users can use to join the course. The admin will be able to sort the users into groups and assign feedback tasks associated with checkpoints. The admin will be able to see meaningful statistics of the users' feedback and the users will be able to see anonymous feedback from their teammates.

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
$ ruby -v
```
If version '2.6.6' is not installed, run:
```
$ rbenv install 2.6.6
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

## Using the App
Once the server is running locally using `$ rails server`, open the local server in a browser at this url:
```
localhost:3000
```

Once there, you may sign up with a new email or login with a preexisting one. All preexisting accounts have the password `password`
The following emails are admin emails already seeded in the database:
```
giles.1@osu.edu
sivilotti.1@osu.edu
kirby.249@osu.edu
```

The following emails are user emails already seeded in the database:
```
hu.2056@osu.edu
garry.19@osu.edu
wang.12470@osu.edu
wilcox.331@osu.edu
vanhoose.3@osu.edu
```

The admin with the most preexisting data is `giles.1@osu.edu` and the user with the most preexisting data is `wang.12470@osu.edu`

## Controller Contributions
The following table is a list of controllers used in the project and who contributed to them. This is to ensure that all project members got an opportunity to work with controller code.
| Controller File Name | Contributor(s) |
| about_controller.rb | Matt |
| application_controller.rb | Matt |
| courses_controller.rb | Kevin, Jack |
| feedback_controller.rb | Matt, Luke |
| main_controller.rb | Matt, Luke |
| passwords_controller.rb | Matt |
| registrations_controller.rb | Matt |
| sessions_controller.rb | Matt, Luke |
| teams_controller.rb | Matt |
