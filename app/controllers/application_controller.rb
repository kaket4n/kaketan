class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin?
    return if current_user.nil?

    current_user.role = "admin"
  end
end
