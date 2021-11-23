class User < ApplicationRecord
  #belongs_to :course, optional: true
  has_many :CoursesUsers
  has_many :courses, :through => :CoursesUsers, :source => :course

  # Broken. role 1 means student
  #if role == 1
  has_many :TeamsUsers
  has_many :teams, :through => :TeamsUsers, :source => :team
  #end

  has_many :feedbacks, class_name: "Feedback", foreign_key: "feedback_id"

end
