require "test_helper"

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:admin)
    get login_path 
    post login_path, params: {email: user.email, password: "password" }
    get root_path 
  end

  test "navigate to user: feedback/" do
    user = users(:student)
    delete logout_path
    get login_path 
    post login_path, params: {email: user.email, password: "password" }
    get root_path 

    get feedback_path
    assert_template 'feedback/user_feedback'
    assert_response :success
  end

  test "navigate to admin: feedback/" do
    get feedback_path
    assert_template 'feedback/admin_feedback'
    assert_response :success
  end

  test "navigate to admin: feedback/new" do
    get new_feedback_path
    assert_template 'feedback/new'
    assert_response :success
  end

  #test "navigate to admin: feedback/completed/1" do
    #get '/feedback/completed/1'
    #assert_template 'feedback/new'
    #assert_response :success
  #end
end
