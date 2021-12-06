class Team < ApplicationRecord
  belongs_to :course
    # Useless?: foreign_key: 'course_id'

  has_many :TeamsUsers
  has_many :users, :through => :TeamsUsers, :source => :user
  has_many :checkpoints

  validates :team_name, presence: true


  # Ensure unique combination of team name and course
  # Cannot have duplicate team names in the same course
  validates_uniqueness_of :team_name, scope: %i[course_id]

end
