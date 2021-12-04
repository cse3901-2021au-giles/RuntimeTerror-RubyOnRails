class MakeColumnsNotNullInFeedbacks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :feedbacks, :team_id, false
    change_column_null :feedbacks, :done, false
    change_column_null :feedbacks, :checkpoint_id, false
  end
end
