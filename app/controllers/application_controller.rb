class ApplicationController < ActionController::API
  include ExceptionHandler
  include Knock::Authenticable
  include CancanWarning
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  # excepcion cancancan recurso no autorizado
  def unauthorized_entity(entity_name)
      render json: { error: "Unauthorized request" }, status: :unauthorized
  end
  
  # excepcion de ruta no encontrada
  def not_found(exception)
      render json: { status: "404", "#{exception.message}": "page not found"}
  end
end
