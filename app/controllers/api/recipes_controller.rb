class Api::RecipesController < ApplicationController

  # before_action do
  #   # can't use session in an api
  #   # @current_user = User.find_by id: session[:id]
  #   unless @current_user
  #     # can't redirect in an api
  #     # redirect_to sign_in_path
  #   end
  # end

  before_action :doorkeeper_authorize!

  def index
    # @recipes = Recipe.all.page(params[:page]).per(1)

    query = Recipe.all
    if params[:category_id].present?
      query = query.where(category_id: params[:category_id])
    end
    # query = query.where(user_id: current_user.id)
    query = query.page(params[:page])
    query = query.per(1)
    @recipes = query

  end

  def show
    @recipe = Recipe.find_by id: params[:id]
  end

  private

  # Find the user that owns the access token
  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
