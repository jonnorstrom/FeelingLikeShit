class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_for_user
    unless session[:user_id]
      session[:user_id] = Random.new_seed
    end
  end
end
