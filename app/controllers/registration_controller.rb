class RegistrationController < ApplicationController

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id # remember who user is
      redirect_to root_path
    else
      render :new
    end
  end
end
