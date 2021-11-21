class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :class_code
      t.string :admin_code

      t.timestamps
    end
  end
end
