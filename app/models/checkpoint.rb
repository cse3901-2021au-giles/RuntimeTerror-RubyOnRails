class Checkpoint < ApplicationRecord

  # Ensure checkpoint belongs to a team
  belongs_to :team

  # Ensure many feedbacks point to a checkpoint
  has_many :feedbacks

  validates :team_id, presence: {message: "- Must pick a team."}

  # Find Course of a given Checkpoint
  def course
    Course.where(id: self.team.course_id).to_a.first
  end
end
