require "test_helper"

class CheckpointTest < ActiveSupport::TestCase
  test "valid checkpoint" do
    checkpoint = checkpoints(:one)
    assert checkpoint.valid?
  end

  test "valid checkpoint 2" do
    checkpoint = checkpoints(:two)
    assert checkpoint.valid?
  end

  test "valid checkpoint without checkpoint_name" do
    checkpoint = Checkpoint.new(id:"3", team_id:"1", due_date:"2021-11-30 11:59:59.00000 +000")
    assert checkpoint.valid?
  end

  test "valid checkpoint without due_date" do
    checkpoint = Checkpoint.new(id:"3", team_id:"1", checkpoint_name:"Due Whenever")
    assert checkpoint.valid?
  end

  test "valid checkpoint without checkpoint_name or due_date" do
    checkpoint = Checkpoint.new(id:"3", team_id:"1")
    assert checkpoint.valid?
  end

  test "invalid checkpoint without team_id" do
    checkpoint = Checkpoint.new(id:"3", checkpoint_name:"Project 2", due_date:"2021-11-30 11:59:59.00000 +000")
    refute checkpoint.valid?
  end

end
