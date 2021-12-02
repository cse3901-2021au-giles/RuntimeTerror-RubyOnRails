class Team < ApplicationRecord
  belongs_to :course
    # Useless?: foreign_key: 'course_id'

  has_many :TeamsUsers
  has_many :users, :through => :TeamsUsers, :source => :user

  # Ensure unique combination of tid and course
  validates_uniqueness_of :tid, scope: %i[course_id]

end
