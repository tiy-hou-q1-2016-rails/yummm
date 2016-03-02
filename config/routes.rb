Rails.application.routes.draw do

  root 'homepage#show'

  get 'recipes' => 'recipes#index', as: :recipes
  get 'recipes/new' => 'recipes#new', as: :new_recipe
  get 'recipes/:id' => 'recipes#show', as: :recipe
  post 'recipes' => 'recipes#create'
end
