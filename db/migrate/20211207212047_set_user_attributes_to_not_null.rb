class SetUserAttributesToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :email, false
    change_column_null :users, :fname, false
    change_column_null :users, :lname, false
    change_column_null :users, :role, false
    change_column_null :users, :password_digest, false
  end
end
