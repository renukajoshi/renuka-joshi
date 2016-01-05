json.array!(@comments) do |comment|
  json.extract! comment, :id, :comment, :tag
  json.url comment_url(comment, format: :json)
end
