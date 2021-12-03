class FeedbackController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index #Current.user must exist so no if statement needed
    if Current.user.role == 1
      render "feedback/user_feedback"
    else
      render "feedback/admin_feedback"
    end
  end

  def completed
    @checkpoint = Checkpoint.find(params[:id]) #Current checkpoint
    unless Current.user.role == 0 || @checkpoint.team.users.include?(Current.user) 
      redirect_to feedback_path, alert: "You're not a part of this team; Unable to access feedback"
    end
    @feedbacks = @checkpoint.feedbacks.where(done: true)
  end

end
