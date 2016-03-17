json.id recipe.id
json.name recipe.name
json.ingredients recipe.ingredients
json.method recipe.method
json.description recipe.description
json.view_count recipe.view_count
json.photo_url recipe.photo_url
json.thumb_photo_url attachment_url(recipe, :photo, :fill, 150, 150, format: "jpg")
json.category_id recipe.category_id
json.category_name recipe.category.name

json.category do
  json.id recipe.category.id
  json.name recipe.category.name
end

json.comments recipe.comments do |comment|
  json.id comment.id
  json.comment_text comment.comment_text
end
