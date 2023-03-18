class Api::V1::TalentsController < ApplicationController
  before_action :set_talent, only: [:assign_course]

  def assign_course
    @talent.course_ids = course_params[:ids]
  end

  private
  def set_talent
    @talent = User.find(params[:id])
  end

  def course_params
    params.require(:courses).permit(ids: [])
  end

end
