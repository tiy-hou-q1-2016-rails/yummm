class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by id: params[:id]
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # get the object
    @recipe = Recipe.new
    # set the fields
    @recipe.name = params[:recipe][:name]
    @recipe.description = params[:recipe][:description]
    @recipe.ingredients = params[:recipe][:ingredients]
    @recipe.method = params[:recipe][:method]
    @recipe.photo_url = params[:recipe][:photo_url]
    # save or redirect

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find_by id: params[:id]
  end

  def update
    # get the object
    @recipe = Recipe.find_by id: params[:id]
    # set the fields
    @recipe.name = params[:recipe][:name]
    @recipe.description = params[:recipe][:description]
    @recipe.ingredients = params[:recipe][:ingredients]
    @recipe.method = params[:recipe][:method]
    @recipe.photo_url = params[:recipe][:photo_url]
    # save redirect or render
    if @recipe.save
      redirect_to recipe_path(id: @recipe.id)
    else
      render :edit
    end
  end

  def delete
    # get the record
    @recipe = Recipe.find_by id: params[:id]

    # destroy the record
    @recipe.destroy
    # redirect away
    redirect_to recipes_path
  end
end
