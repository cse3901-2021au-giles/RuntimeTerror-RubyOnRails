class Team < ApplicationRecord
  belongs_to :course

  has_many :TeamsUsers
  has_many :checkpoints

  # Many to many relationship between course and users
  has_many :users, :through => :TeamsUsers, :source => :user

  # Ensures that team name cannot be null
  validates :team_name, presence: true

  #Ensures that course_id cannot be null
  validates :course_id, presence: true

  # Ensure unique combination of team name and course
  # Cannot have duplicate team names in the same course
  validates_uniqueness_of :team_name, scope: %i[course_id]

end
