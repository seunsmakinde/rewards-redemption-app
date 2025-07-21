class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    private

    def not_found_response(exception)
        render json: { error: exception.message }, status: :not_found
    end
end
