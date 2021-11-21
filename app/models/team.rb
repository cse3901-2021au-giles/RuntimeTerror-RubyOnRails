class Team < ApplicationRecord
  belongs_to :course
    # Useless?: foreign_key: 'course_id'

  has_many :users
end
