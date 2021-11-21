class User < ApplicationRecord

  # If student
  if type == 0
    belongs_to :team
  end

  belongs_to :course

end
