class SessionsController < ApplicationController

  def new
    redirect_to and return root_path if logged_in?
    @user = User.new
  end

  def create
    redirect_to and return root_path if logged_in?
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Successfully signed in"
    else
      redirect_to signin_path, alert: "Wrong credentials"
    end

  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out"
  end
end
