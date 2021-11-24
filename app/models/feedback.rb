class Feedback < ApplicationRecord
  belongs_to :giveuser, class_name: 'User'
  belongs_to :receiveuser, class_name: 'User'
end
