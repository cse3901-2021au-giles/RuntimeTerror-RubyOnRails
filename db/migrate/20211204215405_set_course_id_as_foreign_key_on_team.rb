class SetCourseIdAsForeignKeyOnTeam < ActiveRecord::Migration[6.1]
  def change
    change_column_null :teams, :course_id, false
    add_foreign_key :teams, :courses, on_delete: :cascade, validate: false
  end
end
