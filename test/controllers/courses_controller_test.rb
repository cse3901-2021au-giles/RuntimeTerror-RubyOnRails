require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:admin)
    get login_path 
    post login_path, params: {email: user.email, password: "password" }
    get courses_url
  end

  test "navigate to user: courses/" do
    user = users(:student)
    delete logout_path
    get login_path 
    post login_path, params: {email: user.email, password: "password" }
    get root_path 
    get courses_url
    assert_template 'courses/user'
    assert_response :success
  end

  test "navigate to admin: courses/" do
    assert_template 'courses/admin'
    assert_response :success
  end

  test "navigate to admin: courses/1" do
    get '/courses/1'
    assert_template 'courses/show_course_details'
    assert_response :success
  end

  test "navigate to admin: courses/new" do
    get '/courses/new'
    assert_template 'courses/new'
    assert_response :success
  end
end