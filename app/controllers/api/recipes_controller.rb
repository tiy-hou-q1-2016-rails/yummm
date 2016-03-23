require 'open-uri'

class Api::RecipesController < ApplicationController

  protect_from_forgery with: :null_session


  def index
    @recipes = Recipe.all.order("view_count desc")
  end

  def create
    @recipe = Recipe.new recipe_params

    # Allow to set photo_url instead of local file
    url = params[:recipe][:photo_url]

    if url.present?
      open(url, "rb") do |file|
        @recipe.photo = file
      end
    end

    if @recipe.save
      render :show
    else
      render json: {errors: @recipe.errors}, status: 422
    end
  end

  def categories
    @categories = Category.all
  end

  def recipe_params
    params.require(:recipe).permit(:name, :method, :description, :category_id, :ingredients, :photo)
  end
end
