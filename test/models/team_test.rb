require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test "valid team" do
    team = teams(:one)
    assert team.valid?
  end

  test "valid team 2" do
    team = teams(:two)
    assert team.valid?
  end

  test "invalid team without course_id" do
    team = Team.new(id: "3", team_name:"Team Luigi")
    refute team.valid?
  end

  test "invalid team without team_name" do
    team = Team.new(id: "3", course_id: "1")
    refute team.valid?
  end

  test "invalid team with duplicate name" do
    team = Team.new(id: "3", course_id: "1", team_name: "Runtime Terror")
    refute team.valid?
  end
end
