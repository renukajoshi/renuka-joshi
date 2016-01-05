json.array!(@posts) do |post|
  json.extract! post, :id, :Title, :Description, :tag
  json.url post_url(post, format: :json)
end
