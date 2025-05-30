# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def ensure_admin
    if current_user.role != 'admin'
      raise ActionController::RoutingError, 'Not Found'
    end
  end

end
