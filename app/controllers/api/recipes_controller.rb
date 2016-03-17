class Api::RecipesController < ApplicationController

  def index
    # @recipes = Recipe.all.page(params[:page]).per(1)

    query = Recipe.all
    if params[:category_id].present?
      query = query.where(category_id: params[:category_id])
    end
    query = query.page(params[:page])
    query = query.per(1)
    @recipes = query

  end

  def show
    @recipe = Recipe.find_by id: params[:id]
  end
end
