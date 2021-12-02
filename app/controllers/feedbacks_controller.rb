class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def received
    @user = Current.user
    @teams = @user.teams  #Collection of all of the @users teams
    @assigned_checkpoints = Checkpoint.where(team_id: @teams.ids).where("due_date < ?", DateTime.now).order(due_date: :desc) #Collection of all of the checkpoints assigned to @user where due date has expired
    # @received_feedbacks = #Collection of all received feedbacks from collections (based on due date and done attribute)
  end

  def view_completed
    @user = Current.user
    @checkpoint = Checkpoint.find(params[:id]) #Current checkpoint
    @receivedfeedbacks = Feedback.where(checkpoint_id: @checkpoint.id, receiveuser_id: @user.id, done: true).where.not(giveuser_id: @user.id) #Collection of all feedbacks from checkpoint beside @users
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:fid, :team_id, :checkpoint_id, :giveuser_id, :receiveuser_id, :done, :body, :score)
    end
end
