# app/controllers/concerns/error_handler.rb
module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid_error
    rescue_from StandardError, with: :handle_standard_error
  end

  private

  def handle_record_invalid_error(error)
    Rails.logger.error("Error: #{error.message}")
    render json: { errors: error.message }, status: :unprocessable_entity
  end

  def handle_standard_error(error)
    Rails.logger.error("Unexpected error: #{error.message} ")
    messages = error.message.split(", ")
    render json: { message_errors: messages }, status: :internal_server_error
  end
end
