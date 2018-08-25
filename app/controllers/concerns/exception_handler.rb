# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do

    # Return 404 - Not Found
    #
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    # Return 422 - Unprocessable Entity
    #
    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    # Return 400 - Bad Request
    #
    rescue_from ActionController::ParameterMissing do |e|
      render json: { error: e.message }, status: :bad_request
    end
  end
end
