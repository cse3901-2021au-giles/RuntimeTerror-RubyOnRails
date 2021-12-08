# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_08_035044) do

  create_table "checkpoints", force: :cascade do |t|
    t.integer "team_id", null: false
    t.string "checkpoint_name"
    t.datetime "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.string "class_code", null: false
    t.string "admin_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "giveuser_id", null: false
    t.integer "receiveuser_id", null: false
    t.boolean "done", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "score"
    t.integer "checkpoint_id", null: false
    t.index ["giveuser_id"], name: "index_feedbacks_on_giveuser_id"
    t.index ["receiveuser_id"], name: "index_feedbacks_on_receiveuser_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "course_id", null: false
    t.string "team_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_teams_users_on_team_id"
    t.index ["user_id"], name: "index_teams_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "fname", null: false
    t.string "lname", null: false
    t.integer "role", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "checkpoints", "teams", on_delete: :cascade
  add_foreign_key "courses_users", "courses", on_delete: :cascade
  add_foreign_key "courses_users", "users", on_delete: :cascade
  add_foreign_key "feedbacks", "checkpoints", on_delete: :cascade
  add_foreign_key "feedbacks", "users", column: "giveuser_id"
  add_foreign_key "feedbacks", "users", column: "receiveuser_id"
  add_foreign_key "teams", "courses", on_delete: :cascade
  add_foreign_key "teams_users", "teams", on_delete: :cascade
  add_foreign_key "teams_users", "users", on_delete: :cascade
end
