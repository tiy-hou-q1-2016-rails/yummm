Rails.application.routes.draw do

  root 'homepage#show'

  get 'recipes' => 'recipes#index', as: :recipes
  get 'recipes/:id' => 'recipes#show', as: :recipe
end
