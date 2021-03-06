class SessionsController < ApplicationController
  # Login Form
  def new
  end

  # Login
  def create
    user = User.find_by(email: params[:email].downcase)
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = 'Invalid email or password'
      render 'new'
    end
  end

  # Logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
