class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :show_record_errors
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  rescue_from LearningPathManager::CourseIsEmptyException, with: :course_is_empty
  rescue_from CourseCompletor::UserNotAssignedToThisCourseException, with: :course_is_not_user

  def show_record_errors(errors)
    error_response(errors: errors.record.errors.full_messages, status: 422)
  end

  def error_response(errors:, status:)
    render json: {
      errors: errors,
    }, status: status
  end

  def not_found_response
    render json: {}, status: 404
  end

  def course_is_empty
    error_response(errors: ['Cannot create learning path without courses'], status: 422)
  end

  def course_is_not_user
    error_response(errors: ['Course does not assigned to the talent'], status: 422)
  end
end
