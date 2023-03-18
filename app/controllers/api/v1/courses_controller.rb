class Api::V1::CoursesController < ApplicationController
  def index
    courses = Course.all
    render json: CourseSerializer.new(courses.includes(:author))
      .serializable_hash
  end

  def create
    Course.create!(course_params)
  end

  def show
    render json: CourseSerializer.new(Course.find(params[:id])).serializable_hash
  end

  private
  def course_params
    params.require(:course).permit(:name, :author_id, :learning_path_id, :order_in_learning_path)
  end
end
