json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :admin, :password_salt, :password_hash
  json.url user_url(user, format: :json)
end