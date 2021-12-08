# RuntimeTerror-RubyOnRails
> Contributors (RuntimeTerror): Jack Garry, Matthew Hu, Kevin Wang, Luke Wilcox

RuntimeTerror-RubyOnRails is a peer evaluation tool that allows teams to provide feedback for each other.

This project allows admins to create their own courses with unique class codes that users can use to join the course. The admin will be able to sort the users into groups and assign feedback tasks associated with checkpoints. The admin will be able to see meaningful statistics of the users' feedback and the users will be able to see anonymous feedback from their teammates.

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

Migrate the database and insert the seeds to populate the environment with data:
```
$ rails db:reset
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

## Model Organization
The models for the peer evaluation utilized a hierarchical structure of one to many relationships. Courses can have many teams, but a team must have an associated course. Teams can have many checkpoints, but a checkpoint must have an associated team. Checkpoints can have many feedbacks, but a feedback must have an associated checkpoint. This helps simplify the model. 

Feedbacks are entities that contain a singular feedback instance from an individual user to another individual user. For two users to leave feedback for each other, there will be two Feedbacks, one from user A to user B, and the other from user B to user A. Checkpoints can be thought of as "feedback groups" that contain the feedbacks for an individual team and a particular situation. Teams can have many checkpoints, for example a checkpoint for each project that a team may do, or a multiple checkpoints during the lifespan of a single project. This way, admins have the ability to give teams opportunities to provide feedback to each other multiple times within the same project/operation. 

Courses have both a class code and an admin code. The class codes are to be utilized by users while the admin code is to be used by other admins to join a course. the admin code is currently not in use, however future plans involve allowing multiple admins in a single course with heightened privileges.

## Views Organization
![User Admin View Separation](https://github.com/cse3901-2021au-giles/RuntimeTerror-RubyOnRails/blob/main/viewSeparation_user-admin.png?raw=true)

The image above illustrates how the views are separated between admins and users. Admin views are different from user views, so different embedded ruby files were used to render each one. Admins get more information in each of their views (shown on the bottom) while the users get a more limited view on their pages. For each of the resources, Home(main), Feedback, Course, and Team, there is a respective user.html.erb and admin.html.erb file, allowing for the separation of views.

## Controller Contributions
The following table is a list of controllers used in the project and who contributed to them. This is to ensure that all project members got an opportunity to work with controller code.
| Controller File Name | Contributor(s) |
| -------------------- | -------------- |
| about_controller.rb | Matt |
| application_controller.rb | Matt |
| courses_controller.rb | Kevin, Jack |
| feedback_controller.rb | Luke, Matt, Jack |
| main_controller.rb | Matt, Luke |
| passwords_controller.rb | Matt |
| registrations_controller.rb | Matt |
| sessions_controller.rb | Matt, Luke |
| teams_controller.rb | Matt, Kevin|

## Future Implementations
Given another couple months, the team would like to continue working on this project to implement some improvements and features:
- Better UI utilizing JavaScript,
  The views are currently all static using embedded ruby. In order to provide a better user experience, we plan on integrating javascript with dynamic web pages.
- Custom Forms and Questions,
  The feedbacks are currently limited to a score and written feedback. We would like to expand this functionality by both providing ranking questions that assess teamwork and also allowing admins to create their own questions to give to users. Additionally, allowing admins to customize the feedbacks returned to teams, witholding some questions while including some questions would greatly increase versatility.
- Security and Controller Error Handling,
  This is a very important feature we plan on improving in order to make the app more robust to attack. We currently already have checks in place to ensure users do not access resources without permission, however, we want to make it so even insidious attacks done through file manipulation and other more sophisticated break attempts cannot penetrate our security.

## Requirements Met
### Required Features:
- [x] A user should be able to submit scores and comments for all of their teammates (and only their teammates). The application should sujpport multiple peer evaluations over the semester (eg, for each project).
- [x] An administrative interface should provide the instructor/TA with an easy, intuitive way to populate the class with names and email addresses from a roster and also create the respective teams.
- [x] An administrative interface should give a useful view of the scores assigned within a team. Thsi view should support the instructor's need to assign scores to individuals based on these evaluations, as well as quickly detect potential problems that waqrrant intervention.

### Extensions:
- [x] Authentication/login. Peer evaluations should be connected to an authenticated user, preventing forging of evaluations
- [ ] Admin dashboard to monitor submission of peer evaluations and simplify sending reminders or managing evaluations that are never submitted.
- [x] Support for multiple group structures. A student may belong to multiple groups simultaneously (eg a "project group" and a "technology team" as in 3901)
- [x] Changing enrollment. Students might add or drop the course and this should be handled cleanly by the tool.
- [ ] Audience evaluation of presentations.




