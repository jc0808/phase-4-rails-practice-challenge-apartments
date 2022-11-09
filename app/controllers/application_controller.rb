class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_message


    private

    def render_not_found_message(exception)
        render json: {error: "#{exception.model} not found"}, status: :not_found
    end

    def render_invalid_message(exception)
        render json: {errors: "#{exception.record.errors.full_message}"}, status: :unprocessable_entity
    end
end
