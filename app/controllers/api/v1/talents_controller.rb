class Api::V1::TalentsController < ApplicationController
  before_action :set_talent, only: [:assign_course]

  def assign_course
    @talent.course_enrollment_ids = course_params[:ids]
  end

  def complete_course
    CourseCompletor.new(talent_id: params[:id], course_id: complete_course_params[:id])
      .call
  end

  private
  def set_talent
    @talent = User.find(params[:id])
  end

  def course_params
    params.require(:courses).permit(ids: [])
  end

  def complete_course_params
    params.require(:course).permit(:id)
  end

end
