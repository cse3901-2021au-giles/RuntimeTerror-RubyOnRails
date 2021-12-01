class AddCheckpointIdToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :checkpoint_id, :integer
  end
end
