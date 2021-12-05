class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :remove_course_users, :show_course_details, :edit, :update, :destroy]
  before_action :set_user, only: [:remove_course_users]

  # Render the proper course view page depending on the user role
  # GET /courses
  # GET /courses.json
  def index
    if Current.user.role == 1
      render "courses/user"
    else
      render "courses/admin"
    end
  end

  # For use by user to leave a course
  def removeCourseUser
  end

  # Unused
  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # Get course creation form
  # GET /courses/new
  def new
    @course = Course.new
    @courseAdmin = CoursesUser.new
  end

  # Unused
  # GET /courses/1/edit
  def edit
  end

  # Create a new course based on the course creation form
  # POST /courses/new
  def create
    @course = Course.new(course_params)
      if @course.save

        # Add admin to newly created course. Creates a new record in CoursesUser
        @courseAdmin = CoursesUser.new(course_id: @course.id, user_id: Current.user.id)
        if @courseAdmin.save
          redirect_to view_courses_path, notice: 'Course was successfully created.'
        else
          render :new, notice: 'Failed to join created course.'
        end
      else
        render :new
      end
  end

  # Show the list of students in a given course
  # GET /courses/:id
  def show_course_details
  end

  # For use by admin to remove a user from a course
  # DELETE /courses/:id/:user_id
  def remove_course_users
    # Remove @user from @course. This deletes the corresponding record in CoursesUser
    @course.users.destroy(@user)

    # Iterate through all teams, checkpoints, and feedbacks to remove user appropriately
    @course.teams.each do |t|
      t.checkpoints.each do |cp|
        cp.feedbacks.each do |f|

          # remove all feedbacks that the user has not already given yet, keep completed feedbacks the user has given
          @user.giveuser_feedbacks.where(checkpoint_id: cp.id, done: "false").destroy_all

          # remove all unfinished feedbacks that the user should be receiving, keep completed feedbacks the user has receieved
          @user.receiveuser_feedbacks.where(checkpoint_id: cp.id, done: "false").destroy_all
        end
      end
      
      # remove user from any team that the user is currently a part of (deletes record from TeamsUser)
      t.users.destroy(@user) #Comment out this line to allow users to view previous feedbacks
    end 
    redirect_to view_course_details_path, notice: 'User was successfully removed.' 
  end


  # User: Add a user to a course (add record to CoursesUser)
  # User view
  # POST /courses
  def add_course_user
    # Query the course that the user will join
    course2Add = Course.find_by(class_code: params[:code])

    # if it exists (class_code exists on a course record), create the CoursesUser record
    if course2Add
      @courseUser = CoursesUser.new(course_id:course2Add.id, user_id: Current.user.id)
      
      if @courseUser.save
        redirect_to courses_path, notice: "The course has been joined"
      else
        flash[:alert] = "could not join course"
        if Current.user.role == 1
          render "courses/user"
        else
          render "courses/admin"
        end
      end
    end
  end

  # Unused
  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete course
  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Find the user
    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_name, :class_code, :admin_code)
    end
end
