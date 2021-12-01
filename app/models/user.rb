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
  validates_uniqueness_of :email, message: "- Email already in use."

  # Keep roles between 0 and 1
  validates :role, presence: {message: "- Must pick a role."}, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1, message: "- Must pick a role."}

  # Validate password
  has_secure_password
  validates :password, presence: {message: "- Password can't be blank"}, length: {minimum: 6, message: "- Password must be 6+ characters long"}
  validates :password_confirmation, presence: {message: "- Password confirmation can't be blank"}, length: {minimum: 6, message: "- Password confirmation must be 6+ characters long"}
  
  # Validate Email
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {message: "- Email can't be blank"}, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX, message: "- Must be a valid email address."}, uniqueness: { case_sensitive: false }
  validates :fname, presence: {message: "- First Name can't be blank"}, length: { maximum: 25 }
  validates :lname, presence: {message: "- Last Name can't be blank"}, length: { maximum: 25 }

end
