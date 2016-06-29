class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @c_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def check_user
    unless logged_in?
      flash[:notice] = "Please login first!"
      redirect_to root_path
    end
  end
end
