json.recipes @recipes do |recipe|
  json.id recipe.id
  json.photo_url recipe.photo_url
  json.view_count recipe.view_count
  json.description recipe.description
  json.name recipe.name
  json.recipe_url recipe_path(id: recipe.id)

  json.category do
    json.id recipe.category.id
    json.name recipe.category.name
  end
end
