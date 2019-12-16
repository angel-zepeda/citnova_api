module CancanWarning
  extend ActiveSupport::Concern
  included do
    rescue_from CanCan::AccessDenied do |exception|
      render json: { message: exception.message }, status: 403
    end
  end
end
