require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path 
    assert_template 'sessions/new'
    post login_path, params: {email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path 
    get root_path 
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path 
    assert_template 'sessions/new'
    post login_path, params: {email: "wang.12470@osu.edu", password: "password" }
    get root_path 
    assert_not flash.empty?
  end

  test "logout" do
    get login_path 
    assert_template 'sessions/new'
    post login_path, params: {email: "wang.12470@osu.edu", password: "password" }
    get root_path 
    delete logout_path 
    assert_not flash.empty?
  end
end