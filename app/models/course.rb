class Course < ApplicationRecord
  has_many :teams

  # many to many relationship with user
  has_many :CreateCoursesUsersJoin
  has_many :users, through: :CreateCoursesUsersJoin
end
