class Api::V1::CoursesController < ApplicationController
  before_action :find_course, only: [:show, :destroy, :update]

  def index
    courses = Course.all
    render json: CourseSerializer.new(courses.includes(:author))
      .serializable_hash
  end

  def create
    Course.create!(course_params)
  end

  def show
    render json: CourseSerializer.new(@course).serializable_hash
  end

  def destroy
    @course.destroy
  end

  def update
    @course.update!(course_params)
  end

  private
  def course_params
    params.require(:course).permit(:name, :author_id, :learning_path_id, :order_in_learning_path)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
