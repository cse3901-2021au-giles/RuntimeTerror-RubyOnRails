class ApplicationController < ActionController::Base
  before_action :set_current_user

  # Set Current User to the current Session
  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  # Require a user to be logged in
  def require_user_logged_in!
    redirect_to login_path, alert: "You must be signed in to do that." if Current.user.nil?
  end
end
