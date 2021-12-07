require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:admin)
    get login_path 
    post login_path, params: {email: user.email, password: "password" }
    get root_path
  end

  test "navigate to user: teams/" do
    user = users(:student)
    delete logout_path
    get login_path 
    post login_path, params: {email: user.email, password: "password" }
    get root_path 

    get teams_url
    assert_template 'teams/user'
    assert_response :success
  end

  test "navigate to admin: teams/" do
    get teams_url
    assert_template 'teams/admin'
    assert_response :success
  end

end
