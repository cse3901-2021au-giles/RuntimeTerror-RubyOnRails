class Course < ApplicationRecord
  has_many :teams

  # many to many relationship with user
  has_many :CoursesUsers
  has_many :users, :through => :CoursesUsers, :source => :user

  validates :class_code, presence: true
  validates :admin_code, presence: true
  
  # Ensure there is a unique class code
  validates_uniqueness_of :class_code
  validates_uniqueness_of :admin_code
end
