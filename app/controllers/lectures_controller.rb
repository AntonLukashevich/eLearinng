class LecturesController < ApplicationController
  before_action :set_lecture, only: %i[show edit update destroy move readed]
  before_action :set_course, only: %i[index new create]

  def index
    #@course = Course.find(params[:course_id])
    @lectures = @course.lectures
  end

  def new
    #@course = Course.find(params[:course_id])
    @lecture = Lecture.new
  end

  def show
    @user = current_user
    @readed = Readed.where(:lecture_id => @lecture, :user_id => @user.id).first
  end



  def edit
  end

  def create
    #@course = Course.find(params[:course_id])
    @lecture = @course.lectures.build(lecture_params)

    if @lecture.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def update
    if @lecture.update(lecture_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @lecture.destroy
    redirect_to course_path(@course)
  end

  def move
    #@course = Course.find(params[:course_id])
    #@lecture = @course.lectures.find(params[:id])
    @lecture.insert_at(params[:position].to_i)
    head :ok
  end

  def readed
    @user = current_user
    #@course = Course.find(params[:course_id])
    #@lecture = @course.lectures.find(params[:id])
    @lecture.readeds.create(:lecture_id => @lecture.id,:user_id => @user.id, :is_readed => true )
    redirect_to @course
  end

  def is_readed?
    @user = current_user
    @readed = Readed.where(:lecture_id => @lecture, :user_id => @user.id).first
    return @readed.is_readed
  end

  private

  def lecture_params
    params.require(:lecture).permit(:title, :description, :content)

    #.to_h.tap do |n|
    # binding.pry
    #n["course_block_id"] = params["lecture_id"]
    #n.except!(:lecture_id)
    #end
    #binding.pry
  end

  def set_lecture
    @course = set_course
    @lecture = @course.lectures.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
