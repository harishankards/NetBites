json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :calories, :fat, :protein
  json.url recipe_url(recipe, format: :json)
end
