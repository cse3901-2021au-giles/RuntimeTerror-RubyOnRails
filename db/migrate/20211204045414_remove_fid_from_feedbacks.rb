class RemoveFidFromFeedbacks < ActiveRecord::Migration[6.1]
  def change
    remove_column :feedbacks, :fid, :integer
  end
end
