class User < ApplicationRecord
  # Relation with Courses
  has_many :CoursesUsers
  has_many :courses, :through => :CoursesUsers, :source => :course

  # Relation with Teams
  has_many :TeamsUsers
  has_many :teams, :through => :TeamsUsers, :source => :team

  # Relation with feedback
  has_many :giveuser_feedbacks, class_name: 'Feedback', foreign_key: 'giveuser_id'
  has_many :receiveuser_feedbacks, class_name: 'Feedback', foreign_key: 'receiveuser_id'

  # Ensure different users don't use the same email
  validates_uniqueness_of :email
  
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :fname, presence: true, length: { maximum: 25 }
  validates :lname, presence: true, length: { maximum: 25 }

end
