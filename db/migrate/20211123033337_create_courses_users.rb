class CreateCoursesUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :courses, :users do |t|
      t.index :course_id
      t.index :user_id

      #versus t.integer :id

      t.timestamps
    end
  end
end
