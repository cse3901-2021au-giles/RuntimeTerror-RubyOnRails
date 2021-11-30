class AddScoreToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :score, :integer
  end
end
