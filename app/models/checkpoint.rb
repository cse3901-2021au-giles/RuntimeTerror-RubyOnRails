class Checkpoint < ApplicationRecord

  # Ensure checkpoint belongs to a team
  belongs_to :team

  # Ensure many feedbacks point to a checkpoint
  has_many :feedbacks
end
