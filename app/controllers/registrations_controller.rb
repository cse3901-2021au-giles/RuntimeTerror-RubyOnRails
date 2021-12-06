class RegistrationsController < ApplicationController
  # GET Form to register a new user
  def new
    @user = User.new
  end

  # POST Register a new user
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else
      render :new
    end
  end

  private
  # Permit only specific parameters
  def user_params
    params.require(:user).permit(:fname, :lname, :email, :role, :password, :password_confirmation)
  end
end