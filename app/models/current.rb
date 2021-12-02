class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :courses

  attribute :teams
  attribute :checkpoints
  attribute :give_feedbacks
  attribute :receive_feedbacks
end