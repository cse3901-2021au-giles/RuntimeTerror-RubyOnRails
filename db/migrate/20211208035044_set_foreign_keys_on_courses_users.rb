class SetForeignKeysOnCoursesUsers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :courses_users, :courses, on_delete: :cascade, validate: false
    add_foreign_key :courses_users, :users, on_delete: :cascade, validate: false
  end
end
