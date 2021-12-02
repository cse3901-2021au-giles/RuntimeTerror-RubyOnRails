class Checkpoint < ApplicationRecord

  # Ensure checkpoint belongs to a team
  belongs_to :team

  # Ensure many feedbacks point to a checkpoint
  has_many :feedbacks

  def get_team 
    Team.where(id: self.team_id).to_a.first
  end

  def get_course
    team = self.get_team 
    Course.where(id: team.course_id).to_a.first
  end
end
