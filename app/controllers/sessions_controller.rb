class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: 'Welcome, #{user.id}'
    else
      render "new", notice: "Invalid login details"
    end
  end
end
