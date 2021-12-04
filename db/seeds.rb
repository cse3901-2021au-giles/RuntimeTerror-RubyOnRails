# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Current seeds:

courses = Course.create!([
        {id: "1", course_name: "CSE3901", class_code: "cse3901", admin_code: "zxcv1234"},
        {id: "2", course_name: "CSE3902", class_code: "cse3902", admin_code: "asdf1234"},
        {id: "3", course_name: "CSE3903", class_code: "cse3903", admin_code: "qwer1234"},
        ])

users = User.create! ([
        {id: "1", email: "hu.2056@osu.edu", fname: "Matthew", lname: "Hu", role: "1", password:"password", password_confirmation:"password"},
        {id: "2", email: "garry.19@osu.edu", fname: "Jack", lname: "Garry", role: "1", password:"password", password_confirmation:"password"},
        {id: "3", email: "wang.12470@osu.edu", fname: "Kevin", lname: "Wang", role: "1", password:"password", password_confirmation:"password"},
        {id: "4", email: "wilcox.331@osu.edu", fname: "Luke", lname: "Wilcox", role: "1", password:"password", password_confirmation:"password"},
        {id: "5", email: "giles.1@osu.edu", fname: "Charlie", lname: "Giles", role: "0", password:"password", password_confirmation:"password"},
        {id: "6", email: "vanhoose.3@osu.edu", fname: "Justin", lname: "Vanhoose", role: "1", password:"password", password_confirmation:"password"},
        {id: "7", email: "kirby.249@osu.edu", fname: "Neil", lname: "Kirby", role: "0", password:"password", password_confirmation:"password"},
        {id: "8", email: "sivilotti.1@osu.edu", fname: "Paul", lname: "Sivilotti", role: "0", password:"password", password_confirmation:"password"},
        ])

teams = Team.create! ([
        {id: "1", tid: "1", course_id: "1", team_name:"RuntimeTerror"},
        {id: "2", tid: "2", course_id: "1", team_name:"Team Peach"},
        {id: "3", tid: "3", course_id: "1", team_name:"Team Luigi"},
        ])

checkpoints = Checkpoint.create!([
        {id:"1", team_id:"1", checkpoint_name:"Project 2", due_date:"2021-11-30 11:59:59.00000 +000"},
        {id:"2", team_id:"2", checkpoint_name:"Tech Project", due_date:"2021-12-08 11:59:59.00000 +000"},
        {id:"3", team_id:"3", checkpoint_name:"Tech Project", due_date:"2021-12-08 11:59:59.00000 +000"},
        ])

coursesUsers = CoursesUser.create!([
        {course_id: "1", user_id: "1"},
        {course_id: "1", user_id: "2"},
        {course_id: "1", user_id: "3"},
        {course_id: "1", user_id: "4"},
        {course_id: "1", user_id: "5"},
        {course_id: "1", user_id: "6"},
        {course_id: "2", user_id: "3"},
        {course_id: "2", user_id: "7"},
        {course_id: "3", user_id: "8"},
        ])

teamsUsers = TeamsUser.create!([
        {team_id: "1", user_id: "1"},
        {team_id: "1", user_id: "2"},
        {team_id: "1", user_id: "3"},
        {team_id: "1", user_id: "4"},
        {team_id: "2", user_id: "3"},
        {team_id: "2", user_id: "6"},
        ])

feedbacks = Feedback.create!([
        {id: "1", fid: "1", team_id: "1", checkpoint_id: "1", giveuser_id: "1", receiveuser_id: "2", done: "false", score: "0", body: "text"},
        {id: "2", fid: "2", team_id: "1", checkpoint_id: "1", giveuser_id: "1", receiveuser_id: "3", done: "false", score: "0", body: "text2"},
        {id: "3", fid: "3", team_id: "1", checkpoint_id: "1", giveuser_id: "1", receiveuser_id: "4", done: "false", score: "0", body: "text3"},
        {id: "4", fid: "4", team_id: "1", checkpoint_id: "1", giveuser_id: "2", receiveuser_id: "1", done: "false", score: "0", body: "text4"},
        {id: "5", fid: "5", team_id: "1", checkpoint_id: "1", giveuser_id: "2", receiveuser_id: "3", done: "false", score: "0", body: "text5"},
        {id: "6", fid: "6", team_id: "1", checkpoint_id: "1", giveuser_id: "2", receiveuser_id: "4", done: "false", score: "0", body: "text6"},
        {id: "7", fid: "7", team_id: "1", checkpoint_id: "1", giveuser_id: "3", receiveuser_id: "1", done: "false", score: "0", body: "text7"},
        {id: "8", fid: "8", team_id: "1", checkpoint_id: "1", giveuser_id: "3", receiveuser_id: "2", done: "false", score: "0", body: "text8"},
        {id: "9", fid: "9", team_id: "1", checkpoint_id: "1", giveuser_id: "3", receiveuser_id: "4", done: "false", score: "0", body: "text9"},
        {id: "10", fid: "10", team_id: "1", checkpoint_id: "1", giveuser_id: "4", receiveuser_id: "1", done: "false", score: "0", body: "text10"},
        {id: "11", fid: "11", team_id: "1", checkpoint_id: "1", giveuser_id: "4", receiveuser_id: "2", done: "false", score: "0", body: "text11"},
        {id: "12", fid: "12", team_id: "1", checkpoint_id: "1", giveuser_id: "4", receiveuser_id: "3", done: "false", score: "0", body: "text12"},
        {id: "13", fid: "13", team_id: "2", checkpoint_id: "2", giveuser_id: "3", receiveuser_id: "6", done: "false", score: "0", body: "text13"},
        {id: "14", fid: "14", team_id: "1", checkpoint_id: "1", giveuser_id: "1", receiveuser_id: "3", done: "true", score: "0", body: "text14"},
        {id: "15", fid: "15", team_id: "1", checkpoint_id: "1", giveuser_id: "1", receiveuser_id: "3", done: "false", score: "0", body: "text15"},
        {id: "16", fid: "16", team_id: "1", checkpoint_id: "1", giveuser_id: "1", receiveuser_id: "2", done: "true", score: "0", body: "text16"},
        {id: "17", fid: "17", team_id: "1", checkpoint_id: "1", giveuser_id: "2", receiveuser_id: "3", done: "true", score: "9", body: "Good Job!"},
        ])

