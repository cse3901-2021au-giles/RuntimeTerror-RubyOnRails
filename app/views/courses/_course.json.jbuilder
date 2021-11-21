json.extract! course, :id, :course_name, :class_code, :admin_code, :created_at, :updated_at
json.url course_url(course, format: :json)
