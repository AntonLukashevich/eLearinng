class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]
  after_action :add_course_author_to_authors_table, only: :create

  def index
    @courses  = Course.all
  end

  def new
    @course = Course.new
    #@course.build_course_author
    #binding.pry
  end

  def show
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      #@course.build_course_author
      redirect_to @course
    else
      render 'new'
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    redirect_to users_path
  end

  private
  def course_params
    permitted = params.require(:course).permit(:title, :description,:type_course, :rating, :status)
    # course_author_attributes: [user_id: session[:user_id], course_id: :course.id] )
    permitted.merge!(status: "draft" )
  end

  def set_course
    @course= Course.find(params[:id])
  end

  def add_course_author_to_authors_table
    @course_author = CourseAuthor.create(user_id: User.find_by(id: session[:user_id]), course_id: Course.last.id)
    binding.pry
    @course_author.save
  end


end
