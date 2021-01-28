class ApplicationController < ActionController::Base
  def login(user)
    reset_session
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    reset_session
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
