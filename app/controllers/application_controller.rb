class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  private
  def render_unprocessable_entity_response(exception)
    render json: { messages: exception.record.errors }, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { messages: [exception.message] }, status: :not_found
  end

  def set_pagination
    @page_size = params.fetch('page_size', 10).to_i
    @page = params.fetch('page', 0).to_i
  end
end
