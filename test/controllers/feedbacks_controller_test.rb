require "test_helper"

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback = feedbacks(:one)
  end

  # test "should get index" do
  #   get feedbacks_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_feedback_url
  #   assert_response :success
  # end

  # test "should create feedback" do
  #   assert_difference('Feedback.count') do
  #     post feedbacks_url, params: { feedback: { body: @feedback.body, course_id: @feedback.course_id, done: @feedback.done, fid: @feedback.fid, giveuser: @feedback.giveuser, receiveuser: @feedback.receiveuser, team_id: @feedback.team_id } }
  #   end

  #   assert_redirected_to feedback_url(Feedback.last)
  # end

  # test "should show feedback" do
  #   get feedback_url(@feedback)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get feedback_url(@feedback)
  #   assert_response :success
  # end

  # test "should update feedback" do
  #   patch feedback_url(@feedback), params: { feedback: { body: @feedback.body, course_id: @feedback.course_id, done: @feedback.done, fid: @feedback.fid, giveuser: @feedback.giveuser, receiveuser: @feedback.receiveuser, team_id: @feedback.team_id } }
  #   assert_redirected_to feedback_url(@feedback)
  # end

  # test "should get received" do 
  #   get feedback_received_url
  #   assert_response :success
  # end

  # test "should destroy feedback" do
  #   assert_difference('Feedback.count', -1) do
  #     delete feedback_url(@feedback)
  #   end

  #   assert_redirected_to feedbacks_url
  # end
end
