class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :show_record_errors

  def show_record_errors(errors)
    error_response(errors: errors.record.errors.full_messages, status: 422)
  end

  def error_response(errors:, status:)
    render json: {
      errors: errors,
    }, status: status
  end
end
