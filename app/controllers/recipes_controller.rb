class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order("view_count desc")
  end

  def show
    @recipe = Recipe.find_by id: params[:id]
    @recipe.view_count = @recipe.view_count + 1
    @recipe.save

    @comment = Comment.new
    @comment.recipe = @recipe
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
    @recipe.category_id = params[:recipe][:category_id]
    @recipe.ingredients = params[:recipe][:ingredients]
    @recipe.method = params[:recipe][:method]
    @recipe.photo = params[:recipe][:photo]
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
    @recipe.category_id = params[:recipe][:category_id]
    @recipe.description = params[:recipe][:description]
    @recipe.ingredients = params[:recipe][:ingredients]
    @recipe.method = params[:recipe][:method]
    @recipe.photo = params[:recipe][:photo]
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

  def create_comment
    # get the record
    @recipe = Recipe.find_by id: params[:id]
    @comment = Comment.new

    @comment.comment_text = params[:comment][:comment_text]
    @comment.recipe_id = @recipe.id
    # save it
    if @comment.save
      redirect_to recipe_path(id: @recipe.id)
    else
      render :show
    end
    # redirect or render
  end
end
