class User < ApplicationRecord
  belongs_to :course

  # Broken. role 1 means student
  #if role == 1
  has_many :CreateTeamsUsersJoin
  has_many :teams, through: :CreateTeamsUsersJoin
  #end
end
