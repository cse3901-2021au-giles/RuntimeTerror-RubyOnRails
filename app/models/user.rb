class User < ApplicationRecord
  #belongs_to :course, optional: true
  has_many :CoursesUsers
  has_many :courses, :through => :CoursesUsers, :source => :course

  # Broken. role 1 means student
  #if role == 1
  has_many :TeamsUsers
  has_many :teams, :through => :TeamsUsers, :source => :team
  #end

  # Relation with feedback
  has_many :giveuser_feedbacks, class_name: 'Feedback', foreign_key: 'giveuser_id'
  has_many :receiveuser_feedbacks, class_name: 'Feedback', foreign_key: 'receiveuser_id'
  
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :fname, presence: true, length { maximum: 25 }
  validates :lname, presence: true, length { maximum: 25 }

end
