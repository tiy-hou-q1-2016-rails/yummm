class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order("view_count desc")
  end
end
