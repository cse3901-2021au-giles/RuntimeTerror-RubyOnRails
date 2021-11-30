json.extract! feedback, :id, :fid, :team_id, :course_id, :giveuser_id, :receiveuser_id, :done, :body, :created_at, :updated_at, :score
json.url feedback_url(feedback, format: :json)
