class FeedbackController < ApplicationController
  # Require user to be logged in
  before_action :require_user_logged_in!

  # GET Admin/User - redirect to feedback page
  def index #Current.user must exist so no if statement needed
    if Current.user.role == 1
      render "feedback/user_feedback"
    else
      render "feedback/admin_feedback"
    end
  end

  # GET Admin - form to create new Feedback
  def new
    # Create hash of team names and corresponding ID's for a course
    @course = Course.find(params[:course])
    @hash = {}
    @course.teams.each do |team|
      @hash["#{team.team_name}"] = team.id
    end
  end

  # POST Admin - Create new Checkpoint and Feedbacks for selected teams
  def create
    @team_ids = params[:teams]
    # Iterate through selected teams to give feedback forms
    @team_ids.each do |team_id|
      unless team_id.empty?
        # Create a new Checkpoint for a team
        team = Team.find(team_id)
        checkpoint = team.checkpoints.create(checkpoint_params)
        students = team.users 
        # Assign students from the team new feedbacks for each teammate
        students.each do |student1|
          students.each do |student2|
            unless student1 == student2
              checkpoint.feedbacks.create(giveuser_id: student1.id, receiveuser_id: student2.id, body: "", score: 0, done: false)
            end
          end
        end
      else
        redirect_to feedback_path, alert: "Unsuccessful Feedback Creation: Must Assign to Team(s)"
        return
      end
    end

    redirect_to feedback_path, notice: 'Feedback was Successfully Created.'
  end

  # GET Admin/User - Completed checkpoints
  def completed
    @checkpoint = Checkpoint.find(params[:id]) #Current checkpoint
    unless Current.user.role == 0 || @checkpoint.team.users.include?(Current.user) 
      redirect_to feedback_path, alert: "You're not a part of this team; Unable to access feedback"
    end
    @feedbacks = (Current.user.role == 1) ? @checkpoint.feedbacks.where(done: true, receiveuser_id: Current.user.id) : @checkpoint.feedbacks.where(done: true)
  end

  # GET User - Redirect to a Feedback form
  def form
    checkpoint = Checkpoint.find(params[:checkpoint])
    team = checkpoint.team
    @feedbacks_not_done = Feedback.where(giveuser_id: Current.user.id, done: false, checkpoint_id: checkpoint.id)
    Current.feedback = @feedbacks_not_done.to_a.first
    # Generate form if Feedback not completed
    if Current.feedback
      @receive_user = User.find(Current.feedback.receiveuser_id)
      render "feedback/form"
    else
      redirect_to feedback_path
    end
  end

  # Update Feedbacks
  def update
    @feedback = Feedback.find(feedback_params[:id])
    if @feedback.update(feedback_params)
      redirect_to form_path(checkpoint: @feedback.checkpoint_id)
    else
      redirect_to form_path(checkpoint: @feedback.checkpoint_id), alert: "Something went wrong"
    end
  end

  private 
  # Private methods to ensure no malicious code
  def feedback_params
    params.require(:feedback).permit(:score, :body, :id, :done)
  end

  def create_params
    params.permit(:teams, :checkpoint_name, :due_date)
  end

  def checkpoint_params
    params.permit(:checkpoint_name, :due_date)
  end
end
