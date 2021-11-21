class CreateTeamsUsersJoin < ActiveRecord::Migration[6.1]
  def change
    create_join_table :teams, :users do |t|

      # Create index for each column
      t.index :team_id
      t.index :user_id

      t.timestamps
    end
  end
end
