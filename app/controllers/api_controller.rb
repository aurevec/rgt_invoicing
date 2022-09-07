class ApiController < ActionController::API

  # Errors

  rescue_from ActionController::BadRequest do
    render json: {}, status: :bad_request
  end

  rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound do
    render json: {}, status: :not_found
  end

  def not_found!
    raise ActionController::RoutingError, "Not Found"
  end

  def bad_request!
    raise ActionController::BadRequest, "Bad Request"
  end

end