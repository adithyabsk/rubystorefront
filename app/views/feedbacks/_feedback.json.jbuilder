json.extract! feedback, :id, :text, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
