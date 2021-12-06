class TeamsController < ApplicationController
  def index
    if Current.user.role == 1
      render "teams/user"
    else
      render "teams/admin"
    end
  end

  def delete
    team = Team.find(delete_params[:id])
    team.destroy
    redirect_to teams_path
  end
    
  def team
    @course = Course.find(params[:course])
    render "shared/error" if (Current.user.role == 1 || !@course.users.include?(Current.user))
    @hash = {}
    @course.users.where(role: 1).each do |student|
      @hash["#{student.fname} #{student.lname}"] = student.id
    end
  end

  def create
    @team = Team.create(course_id: create_params[:course_id], team_name: create_params[:name])
    #render html: params[:students]
    params[:students].each do |sid|
      TeamsUser.create(team_id: @team.id, user_id: sid)
    end

    redirect_to teams_path, notice: "Successfully created team: #{create_params[:name]}"
  end

  private
  def delete_params
    params.permit(:id)
  end

  def create_params
    params.permit(:name, :students, :course_id)
  end
end