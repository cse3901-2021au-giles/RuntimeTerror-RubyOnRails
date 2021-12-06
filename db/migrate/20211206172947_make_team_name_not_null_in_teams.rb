class MakeTeamNameNotNullInTeams < ActiveRecord::Migration[6.1]
  def change
    change_column_null :teams, :team_name, false
  end
end
