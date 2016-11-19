class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_for_user
    if !session[:user_id]
      session[:user_id] = (Random.rand * 1000).floor
    end
  end

  def current_user
    return session[:user_id] if session[:user_id]
  end
end
