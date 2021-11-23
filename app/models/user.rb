class User < ApplicationRecord
  belongs_to :course, optional: true

  # Broken. role 1 means student
  #if role == 1
  has_many :TeamsUsers
  has_many :teams, through: :TeamsUsers
  #end

  has_many :feedbacks, class_name: "Feedback", foreign_key: "feedback_id"

end
