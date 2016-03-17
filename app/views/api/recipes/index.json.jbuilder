json.recipes @recipes do |recipe|
  json.partial! 'recipe', recipe: recipe
end
json.meta do
  json.time Time.now
  json.total_count @recipes.total_count
  json.page @recipes.current_page
end
