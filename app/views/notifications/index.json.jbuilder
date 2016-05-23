json.array!(@notifications) do |notification|
  json.extract! notification, :id, :message, :addfriend, :addfgroup, :delfriend, :delfgroup, :user_id
  json.url notification_url(notification, format: :json)
end
