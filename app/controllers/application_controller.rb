class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :show_record_errors
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

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
end
