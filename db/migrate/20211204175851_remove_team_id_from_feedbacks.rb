class RemoveTeamIdFromFeedbacks < ActiveRecord::Migration[6.1]
  def change
    #remove_foreign_key :feedbacks, :teams 
    #remove_index :feedbacks, column: :team_id
    remove_column :feedbacks, :team_id, :integer
  end
end
