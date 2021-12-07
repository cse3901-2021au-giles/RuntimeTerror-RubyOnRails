require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(id: "4", email: "garry.19@osu.edu", fname: "Jack", lname: "Garry", role: "1", password:"password", password_confirmation:"password")
    assert user.valid?
  end

  test "invalid user without email" do
    user = User.new(id: "4", fname: "Jack", lname: "Garry", role: "1", password:"password", password_confirmation:"password")
    refute user.valid?
  end

  test "invalid user without fname" do
    user = User.new(id: "4", email: "garry.19@osu.edu", lname: "Garry", role: "1", password:"password", password_confirmation:"password")
    refute user.valid?
  end

  test "invalid user without lname" do
    user = User.new(id: "4", email: "garry.19@osu.edu", fname: "Jack", role: "1", password:"password", password_confirmation:"password")
    refute user.valid?
  end

  test "invalid user without role" do
    user = User.new(id: "4", email: "garry.19@osu.edu", fname: "Jack", lname: "Garry", password:"password", password_confirmation:"password")
    refute user.valid?
  end

  test "invalid user without password" do
    user = User.new(id: "4", email: "garry.19@osu.edu", fname: "Jack", lname: "Garry", role:"1", password_confirmation:"password")
    refute user.valid?
  end

  test "invalid user without password_confirmation" do
    user = User.new(id: "4", email: "garry.19@osu.edu", fname: "Jack", lname: "Garry", role:"1", password:"password")
    refute user.valid?
  end

  test "invalid user without password or password_confirmation" do
    user = User.new(id: "4", email: "garry.19@osu.edu", fname: "Jack", lname: "Garry", role:"1")
    refute user.valid?
  end

  test "invalid user with malformed email" do
    user = User.new(id: "4", email: "garry.19osu.edu", fname: "Jack", lname: "Garry", role: "1", password:"password", password_confirmation:"password")
    refute user.valid?
  end

  test "invalid user with duplicate email" do
    user = User.new(id: "4", email: "hu.2056@osu.edu", fname: "Jack", lname: "Garry", role: "1", password:"password", password_confirmation:"password")
    refute user.valid?
  end

  test "invalid user with short password" do
    user = User.new(id: "4", email: "garry.19@osu.edu", fname: "Jack", lname: "Garry", role: "1", password:"passw", password_confirmation:"passw")
    refute user.valid?
  end
end
