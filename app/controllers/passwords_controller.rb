class PasswordsController < ApplicationController
  # Require user to be logged in
  before_action :require_user_logged_in!

  # GET - Form to change password
  def edit 
  end

  # PATCH - Update password
  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password updated!"
    else
      render :edit
    end
  end

  private
  # Private methods to ensure no malicious code
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end