class CoursesUser < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates_uniqueness_of :course_id, scope: %i[user_id]
end
