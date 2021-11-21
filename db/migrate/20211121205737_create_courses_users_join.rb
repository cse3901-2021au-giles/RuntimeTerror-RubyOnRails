class CreateCoursesUsersJoin < ActiveRecord::Migration[6.1]
  def change
    create_join_table :courses, :users do |t|

      # Create index for each column
      t.index :course_id
      t.index :user_id

      t.timestamps
    end
  end
end
