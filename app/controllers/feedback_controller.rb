class FeedbackController < ApplicationController
  # Require user to be logged in
  before_action :require_user_logged_in!

  def index #Current.user must exist so no if statement needed
    if Current.user.role == 1
      render "feedback/user_feedback"
    else
      render "feedback/admin_feedback"
    end
  end

  def new
    @checkpoint = Checkpoint.new
    @feedback = Feedback.new
  end

  def create
    @checkpoint = Checkpoint.new(checkpoint_params)
      if @checkpoint.save
        # Add admin to newly created course. Creates a new record in CoursesUser
        Team.find_by(id: @checkpoint.team_id).users.each do |ou|
          Team.find_by(id: @checkpoint.team_id).users.each do |iu|
            unless ou == iu
              @feedback = Feedback.new(giveuser_id: ou.id, receiveuser_id: iu.id, body: "", score: 0, done: false, checkpoint_id: @checkpoint.id)
              @feedback.save
            end
          end
        end
        redirect_to feedback_path, notice: 'Feedback was successfully created.'
      else
        render :new
      end
  end

  def completed
    @checkpoint = Checkpoint.find(params[:id]) #Current checkpoint
    unless Current.user.role == 0 || @checkpoint.team.users.include?(Current.user) 
      redirect_to feedback_path, alert: "You're not a part of this team; Unable to access feedback"
    end
    @feedbacks = (Current.user.role == 1) ? @checkpoint.feedbacks.where(done: true, receiveuser_id: Current.user.id) : @checkpoint.feedbacks.where(done: true)
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

  def checkpoint_params
    params.require(:checkpoint).permit(:team_id, :checkpoint_name, :due_date)
  end
end
