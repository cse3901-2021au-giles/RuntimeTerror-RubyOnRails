class Feedback < ApplicationRecord

  # Ensure feedback belongs to checkpoint
  belongs_to :checkpoint

  # Clarify foreign keys giveuser and receiveuser point to user
  belongs_to :giveuser, class_name: 'User'
  belongs_to :receiveuser, class_name: 'User'

  # Keep scores between 0 and 10 inclusive
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

  # Ensure the combination of team_id, checkpoint_id, giveuser_id, and receiveuser_id is unique
  validates_uniqueness_of :team_id, scope: %i[checkpoint_id giveuser_id receiveuser_id]

  def course
    Course.where(id: self.team.course_id).to_a.first
  end
end
