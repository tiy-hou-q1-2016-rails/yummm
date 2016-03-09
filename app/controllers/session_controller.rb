class SessionController < ApplicationController
  def new
  end

  def create
    # get the object
    passcode = params[:passcode]
    # set the values
    if passcode == "yolo"
      session[:passcode] = true
      redirect_to recipes_path
    else
      render :new
    end
    # redirect if we save
  end

  def delete
    session[:passcode] = nil
    redirect_to root_path
  end
end
