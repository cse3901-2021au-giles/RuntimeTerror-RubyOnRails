class SessionsController < ApplicationController
  def new
    render html: "Home"
  end
  
  def create
    user = User.find_by(emial: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log in
    else
      flash[:danger] = 'Invalid email/passowrd'
      render 'new'
    end
  end
end
