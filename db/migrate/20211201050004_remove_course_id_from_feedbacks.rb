class RemoveCourseIdFromFeedbacks < ActiveRecord::Migration[6.1]
  def change
    remove_column :feedbacks, :course_id, :integer
  end
end
