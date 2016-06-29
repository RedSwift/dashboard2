class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_email] = user.email
      redirect_to home_path, notice: "Welcome, #{user.email}"
    else
      render "new", notice: "Invalid login details"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logged out"
    redirect_to root_path
  end
end
