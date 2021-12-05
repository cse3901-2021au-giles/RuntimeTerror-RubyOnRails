class TeamsController < ApplicationController
  def index
    if Current.user.role == 1
      render "teams/user"
    else
      render "teams/admin"
    end
  end

  def team
    @course = Course.find(params[:course])
    render "shared/error" if (Current.user.role == 1 || !@course.users.include?(Current.user))
    @students = @course.users.where(role: 1)
  end
end