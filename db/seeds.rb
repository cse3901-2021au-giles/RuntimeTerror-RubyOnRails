# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Current seeds:

#   courses = Course.create([
#             {id: "1", course_name: "CSE3901", class_code: "asdf1234", admin_code: "qwer1234"}
#   ])

#   users = User.create ([
#           {id: "1", email: "hu.2056@osu.edu", fname: "Matthew", lname: "Hu", role: "1", password:"asdf1"},
#           {id: "2", email: "garry.19@osu.edu", fname: "Jack", lname: "Garry", role: "1", password:"asdf2"},
#           {id: "3", email: "wang.12470@osu.edu", fname: "Kevin", lname: "Wang", role: "1", password:"asdf3"},
#           {id: "4", email: "wilcox.331@osu.edu", fname: "Luke", lname: "Wilcox", role: "1", password:"asdf4"},
#           {id: "5", email: "giles.1@osu.edu", fname: "Charlie", lname: "Giles", role: "0", password:"asdf5"},
#           {id: "6", email: "vanhoose.3@osu.edu", fname: "Justin", lname: "Vanhoose", role: "1", password:"asdf6"}
#   ])

#   teams = Team.create ([
#           {id: "1", tid: "1", course_id: "1", team_name:"RuntimeTerror"},
#           {id: "2", tid: "2", course_id: "1", team_name:"Team Peach"},
#           {id: "3", tid: "3", course_id: "1", team_name:"Team Luigi"}
#   ])

#   coursesUsers = CoursesUser.create([
#                  {course_id: "1", user_id: "1"},
#                  {course_id: "1", user_id: "2"},
#                  {course_id: "1", user_id: "3"},
#                  {course_id: "1", user_id: "4"},
#                  {course_id: "1", user_id: "5"},
#                  {course_id: "1", user_id: "6"},
#   ])

#   teamsUsers = TeamsUser.create([
#                  {team_id: "1", user_id: "1"},
#                  {team_id: "1", user_id: "2"},
#                  {team_id: "1", user_id: "3"},
#                  {team_id: "1", user_id: "4"},
#                  {team_id: "2", user_id: "3"},
#                  {team_id: "2", user_id: "6"},
#   ])

#   feedbacks = Feedback.create([
#                   {id: "1", fid: "1", team_id: "1", course_id: "1", giveuser_id: "1", receiveuser_id: "2", done: "false", body: "text"},
#                   {id: "2", fid: "1", team_id: "1", course_id: "1", giveuser_id: "1", receiveuser_id: "3", done: "false", body: "text2"},
#                   {id: "3", fid: "1", team_id: "1", course_id: "1", giveuser_id: "1", receiveuser_id: "4", done: "false", body: "text3"},
#                   {id: "4", fid: "1", team_id: "1", course_id: "1", giveuser_id: "2", receiveuser_id: "1", done: "false", body: "text4"},
#                   {id: "5", fid: "1", team_id: "1", course_id: "1", giveuser_id: "2", receiveuser_id: "3", done: "false", body: "text5"},
#                   {id: "6", fid: "1", team_id: "1", course_id: "1", giveuser_id: "2", receiveuser_id: "4", done: "false", body: "text6"},
#                   {id: "7", fid: "1", team_id: "1", course_id: "1", giveuser_id: "3", receiveuser_id: "1", done: "false", body: "text7"},
#                   {id: "8", fid: "1", team_id: "1", course_id: "1", giveuser_id: "3", receiveuser_id: "2", done: "false", body: "text8"},
#                   {id: "9", fid: "1", team_id: "1", course_id: "1", giveuser_id: "3", receiveuser_id: "4", done: "false", body: "text9"},
#                   {id: "10", fid: "1", team_id: "1", course_id: "1", giveuser_id: "4", receiveuser_id: "1", done: "false", body: "text10"},
#                   {id: "11", fid: "1", team_id: "1", course_id: "1", giveuser_id: "4", receiveuser_id: "2", done: "false", body: "text11"},
#                   {id: "12", fid: "1", team_id: "1", course_id: "1", giveuser_id: "4", receiveuser_id: "3", done: "false", body: "text12"},
#                   {id: "13", fid: "1", team_id: "2", course_id: "1", giveuser_id: "3", receiveuser_id: "6", done: "false", body: "text13"},
#   ])