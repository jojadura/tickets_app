json.array!(@comments) do |comment|
  json.extract! comment, :id, :note, :read, :support_id, :user_id
  json.url comment_url(comment, format: :json)
end
