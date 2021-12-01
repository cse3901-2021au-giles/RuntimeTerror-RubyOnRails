class CreateCheckpoints < ActiveRecord::Migration[6.1]
  def change
    create_table :checkpoints do |t|
      t.integer :team_id
      t.string :checkpoint_name
      t.datetime :due_date

      t.timestamps
    end
  end
end
