class Api::RegistrationController < ApplicationController

  # Let's POSTs and PUTs and PATCHs happen on an API
  protect_from_forgery with: :null_session

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def create
    @user = User.new user_params
    if @user.save

      # in an API, no sessions!
      # in an API, no redirects!

      # session[:user_id] = @user.id # remember who user is
      # redirect_to root_path

      # this will render api/registration/create.json.jbuilder
    else
      # render :new
      render json: @user.errors, status: 422
    end
  end

end
