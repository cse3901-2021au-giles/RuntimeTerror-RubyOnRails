class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :remove_course_users, :show_course_details, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    #@course = Course.new
    #@courseUser = CoursesUser.new
    if Current.user.role == 1
      render "courses/user"
    else
      render "courses/admin"
    end
    #@courses = Course.all
  end

  # For use by user to leave a course
  def removeCourseUser
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    @courseAdmin = CoursesUser.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses/new
  def create
    @course = Course.new(course_params)

      if @course.save
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

  def show_course_details
    @course = Course.find(params[:id])
    #render "courses/show_course_details"
  end

  # For use by admin to remove a user from a course
  def remove_course_users
    @user = User.find(params[:user_id])
    #render plain: @user.fname
    @course.users.delete(@user)
    #@course.teams.each do |t|
      #t.users.delete(@user)
    #end 
    #@cu2delete = CoursesUser.find_by(course_id: @course.id, user_id: params[:user_id])
    #@cu2delete.destroy
    redirect_to view_course_details_path, notice: 'User was successfully removed.' 

  end

  # POST /courses
  # Add a user to a course
  def addCourseUser
    course2Add = Course.find_by(class_code: params[:code])

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

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_name, :class_code, :admin_code)
    end
end
