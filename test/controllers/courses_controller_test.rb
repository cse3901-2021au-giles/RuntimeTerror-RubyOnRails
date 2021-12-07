require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = User.create! ({id: "1", email: "hu.2056@osu.edu", fname: "Matthew", lname: "Hu", role: "1", password:"password", password_confirmation:"password"})
    @admin = users(:two)
    @course = courses(:one)
  end


  test "should get user course page" do
    post login_path(email: @student.email, password: @student.password)
    get view_courses_url
    assert_response :success
  end

  # test "should get index" do
  #   get courses_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_course_url
  #   assert_response :success
  # end

  # test "should create course" do
  #   assert_difference('Course.count') do
  #     post registrations_new_paths, params: { course: { admin_code: @course.admin_code, class_code: @course.class_code, course_name: @course.course_name } }
  #   end

  #   assert_redirected_to course_url(Course.last)
  # end

  # test "should show course" do
  #   get view_course_details_path(@course)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_course_url(@course)
  #   assert_response :success
  # end

  # test "should update course" do
  #   patch course_url(@course), params: { course: { admin_code: @course.admin_code, class_code: @course.class_code, course_name: @course.course_name } }
  #   assert_redirected_to course_url(@course)
  # end

  # test "should destroy course" do
  #   assert_difference('Course.count', -1) do
  #     delete course_url(@course)
  #   end

  #   assert_redirected_to courses_url
  # end
end
