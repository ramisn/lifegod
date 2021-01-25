json.extract! user, :id, :email, :password, :comments, :status, :misc, :preferences, :terms, :type, :created_at, :updated_at
json.url user_url(user, format: :json)
