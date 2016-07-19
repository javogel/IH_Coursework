json.array!(@ingredients) do |ingredient|
  json.name ingredient.name
  json.calories ingredient.calories
end
