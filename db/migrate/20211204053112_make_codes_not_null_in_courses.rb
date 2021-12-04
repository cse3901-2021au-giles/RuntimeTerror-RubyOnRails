class MakeCodesNotNullInCourses < ActiveRecord::Migration[6.1]
  def change
    change_column_null :courses, :class_code, false
    change_column_null :courses, :admin_code, false
  end
end
