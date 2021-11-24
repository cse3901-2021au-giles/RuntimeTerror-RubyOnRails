json.extract! feedback, :id, :fid, :team_id, :course_id, :giveuser, :receiveuser, :done, :body, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
