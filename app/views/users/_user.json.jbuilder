json.extract! user, :id, :username, :first_name, :last_name
json.url user_url(user, format: :json)
