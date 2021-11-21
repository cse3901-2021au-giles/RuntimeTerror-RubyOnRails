class Course < ApplicationRecord
  has_many :teams

  # many to many relationship with user
  has_many :users, through: :teams
end
