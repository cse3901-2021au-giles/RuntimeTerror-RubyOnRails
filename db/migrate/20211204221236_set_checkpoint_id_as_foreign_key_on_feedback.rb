class SetCheckpointIdAsForeignKeyOnFeedback < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :feedbacks, :checkpoints, on_delete: :cascade, validate: false
  end
end
