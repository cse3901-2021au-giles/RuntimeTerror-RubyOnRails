require "test_helper"

class FeedbackTest < ActiveSupport::TestCase
  test "valid feedback" do
    feedback = feedbacks(:one)
    assert feedback.valid?
  end

  test "valid feedback 2" do
    feedback = feedbacks(:two)
    assert feedback.valid?
  end

  test "valid feedback with empty text" do
    feedback = Feedback.new(id: "3", checkpoint_id: "1", giveuser_id: "3", receiveuser_id: "1", done: "false", score: "0", body: "")
    assert feedback.valid?
  end

  test "invalid feedback with score too large" do
    feedback = Feedback.new(id: "3", checkpoint_id: "1", giveuser_id: "3", receiveuser_id: "1", done: "false", score: "11", body: "text")
    refute feedback.valid?
  end

  test "invalid feedback with score too small" do
    feedback = Feedback.new(id: "3", checkpoint_id: "1", giveuser_id: "3", receiveuser_id: "1", done: "false", score: "-1", body: "text")
    refute feedback.valid?
  end

  test "invalid feedback with duplicate checkpoint_id, giveuser_id, and receiveuser_id" do
    feedback = Feedback.new(id: "3", checkpoint_id: "1", giveuser_id: "1", receiveuser_id: "2", done: "false", score: "0", body: "text")
    refute feedback.valid?
  end
end
