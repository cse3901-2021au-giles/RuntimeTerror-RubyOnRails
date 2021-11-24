class Feedback < ApplicationRecord

  # Clarify foreign keys giveuser and receiveuser point to user
  belongs_to :giveuser, class_name: 'User'
  belongs_to :receiveuser, class_name: 'User'

  # Ensure the combination of fid, team_id, course_id, giveuser_id, and receiveuser_id is unique
  validates_uniqueness_of :fid, scope: %i[team_id course_id giveuser_id receiveuser_id]

end
