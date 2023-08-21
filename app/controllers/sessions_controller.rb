class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) 
      session[:user_id] = user.id
      redirect_to root_path
    else
      if User.find_by(email: params[:session][:email])
        flash.alert = " Invalid credentials"
        render 'new', status: :unprocessable_entity
      else
        flash.alert = "User not found"
        render 'new', status: :unprocessable_entity
      end
    end
    end

  def destroy
    session.clear 
    redirect_to login_path
  end
end
