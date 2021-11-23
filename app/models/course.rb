class Course < ApplicationRecord
  has_many :teams

  # many to many relationship with user
  has_many :CoursesUsers
  has_many :users, :through => :CoursesUsers, :source => :user
end
