class Feedback < ApplicationRecord
  belongs_to :giveuser_id, class_name: "User", foreign_key: 'giveuser_id'
  belongs_to :receiveuser_id, class_name: "User", foreign_key: 'receiveuser_id'

end
