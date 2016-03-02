Rails.application.routes.draw do

  root 'homepage#show'

  get 'recipes' => 'recipes#index', as: :recipes
  get 'recipes/new' => 'recipes#new', as: :new_recipe
  get 'recipes/:id' => 'recipes#show', as: :recipe
  get 'recipes/:id/edit' => 'recipes#edit', as: :edit_recipe
  post 'recipes' => 'recipes#create'
  patch 'recipes/:id' => 'recipes#update'
  delete 'recipes/:id' => 'recipes#delete'
end
