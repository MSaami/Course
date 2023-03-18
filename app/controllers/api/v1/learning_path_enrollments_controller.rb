class Api::V1::LearningPathEnrollmentsController < ApplicationController
  def create
    LearningPathEnrollmentManager.new(
      talent_id: enrollments_params[:id],
      learning_path_id: params[:learning_path_id]
    ).call
  end

  private
  def enrollments_params
    params.require(:user).permit(:id)
  end

end
