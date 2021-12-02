class Current < ActiveSupport::CurrentAttributes
  attribute :user

  # We want to remove these eventually
  attribute :courses
  attribute :teams
end