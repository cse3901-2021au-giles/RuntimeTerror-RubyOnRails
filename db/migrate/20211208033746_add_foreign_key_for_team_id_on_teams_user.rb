class AddForeignKeyForTeamIdOnTeamsUser < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :teams_users, :teams, on_delete: :cascade, validate: false
    add_foreign_key :teams_users, :users, on_delete: :cascade, validate: false
  end
end
