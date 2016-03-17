Rails.application.routes.draw do

  use_doorkeeper

  get 'sign_in' => 'session#new', as: :sign_in
  post 'sign_in' => 'session#create'
  get 'sign_out' => 'session#delete', as: :sign_out
  root 'homepage#show'

  get '/register' => 'registration#new', as: :new_user
  post '/register' => 'registration#create', as: :users

  # get 'recipes' => 'recipes#index', as: :recipes
  # get 'recipes/new' => 'recipes#new', as: :new_recipe
  # get 'recipes/:id' => 'recipes#show', as: :recipe
  # get 'recipes/:id/edit' => 'recipes#edit', as: :edit_recipe
  # post 'recipes' => 'recipes#create'
  # patch 'recipes/:id' => 'recipes#update'
  # delete 'recipes/:id' => 'recipes#delete'
  resources :recipes
  post 'recipes/:id/comments' => 'recipes#create_comment', as: :comments


  namespace :api do
    # get 'recipes' => 'recipes#index', as: :recipes
    # get 'recipes/:id' => 'recipes#show', as: :recipe
    # post 'recipes' => 'recipes#create'
    # patch 'recipes/:id' => 'recipes#update'
    # delete 'recipes/:id' => 'recipes#delete'

    resources :recipes
    post 'register' => 'registration#create'
  end

end
