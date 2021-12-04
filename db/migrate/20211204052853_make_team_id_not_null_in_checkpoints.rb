class MakeTeamIdNotNullInCheckpoints < ActiveRecord::Migration[6.1]
  def change
    change_column_null :checkpoints, :team_id, false
  end
end
