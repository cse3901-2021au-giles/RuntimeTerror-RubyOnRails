class FeedbackController < ApplicationController
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
    @feedbacks = @checkpoint.feedbacks.where(done: true, receiveuser_id: Current.user.id)
  end

  def form
    checkpoint = Checkpoint.find(params[:checkpoint])
    team = checkpoint.team
    @feedbacks_not_done = Feedback.where(giveuser_id: Current.user.id, done: false, checkpoint_id: checkpoint.id)
    Current.feedback = @feedbacks_not_done.to_a.first
    if Current.feedback
      @receive_user = User.find(Current.feedback.receiveuser_id)
      render "feedback/form"
    else
      redirect_to feedback_path
    end
  end

  def update
    @feedback = Feedback.find(feedback_params[:id])
    if @feedback.update(feedback_params)
      redirect_to form_path(checkpoint: @feedback.checkpoint_id)
    else
      redirect_to form_path(checkpoint: @feedback.checkpoint_id), alert: "Something went wrong"
    end
  end

  private 
  def feedback_params
    params.require(:feedback).permit(:score, :body, :id, :done)
  end
end
