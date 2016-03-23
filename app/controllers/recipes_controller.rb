class RecipesController < ApplicationController

  before_action do

    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      redirect_to sign_in_path
    end
  end

  def react_form
  end

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
    @recipe = Recipe.new recipe_params
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
    @recipe = Recipe.find_by id: params[:id]
    if @recipe.update recipe_params
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

  def recipe_params
    params.require(:recipe).permit(:name, :method, :description, :category_id, :ingredients, :photo)
  end
end
