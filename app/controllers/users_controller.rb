class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #layout 'application'

  def dashboard
    @courses = Course.find(@user.courses.ids)
    @teams = Team.find(@user.teams.ids)
    @giveuser_feedbacks = Feedback.find(@user.giveuser_feedbacks.ids)
    @receiveuser_feedback = Feedback.find(@user.receiveuser_feedbacks.ids)
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  # User Profile dashboard
  def show
    #useless?
    @user = User.find(params[:id])

    @courses = Course.find(@user.courses.ids)
    @teams = Team.find(@user.teams.ids)
    @user_feedbackGroups = Feedback.group(:fid, :team_id, :course_id).where(giveuser_id: @user.id)
    @giveuser_feedbacks = Feedback.order(created_at: :desc).find(@user.giveuser_feedbacks.ids)
    #@giveuser_feedbacks.order(created_at: :desc)

    @receiveuser_feedback = Feedback.find(@user.receiveuser_feedbacks.ids)

    # Display student or admin view depending on the role
    if @user.role == 1
      render "studentView"
    elsif @user.role == 0
      render "adminView"
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getName(user)
    return user.fname + " " + user.lname
  end

  helper_method :getName

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :fname, :lname, :role, :password)
    end
end
