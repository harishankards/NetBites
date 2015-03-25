json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :commenter, :references, :references
  json.url comment_url(comment, format: :json)
end
