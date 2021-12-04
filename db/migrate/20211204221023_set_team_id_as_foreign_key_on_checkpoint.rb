class SetTeamIdAsForeignKeyOnCheckpoint < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :checkpoints, :teams, on_delete: :cascade, validate: false
  end
end
