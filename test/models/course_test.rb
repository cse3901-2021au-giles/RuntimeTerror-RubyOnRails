require "test_helper"

class CourseTest < ActiveSupport::TestCase
  test "valid course" do
    course = courses(:one)
    assert course.valid?
  end

  test "valid course 2" do
    course = courses(:two)
    assert course.valid?
  end

  test "invalid without class_code" do
    course = Course.new(id: "3", course_name:"noClassCode", admin_code:"asdfd")
    refute course.valid?, "course is valid without a class code"
  end

  test "invalid without admin_code" do
    course = Course.new(id: "3", course_name:"noClassCode", class_code:"asdfd")
    refute course.valid?, "course is valid without an admin code"
  end

  test "invalid with duplicate class code" do
    course = Course.new(id: "3", course_name:"DupeClassCode", class_code: "MyString2", admin_code:"MyString4")
    refute course.valid?, "course is valid with a duplicate class code"
  end

  test "invalid with duplicate admin code" do
    course = Course.new(id: "3", course_name: "DupeAdminCode", class_code: "MyString234", admin_code:"MyString2")
    refute course.valid?, "course is valid with a duplicate admin code"
  end
end
