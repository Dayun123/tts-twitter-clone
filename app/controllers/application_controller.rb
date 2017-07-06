class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Only run this action if the request is using the Devise controller.
  before_action :configure_permitted_user_parameters, if: :devise_controller?

  protected

    def configure_permitted_user_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name, :username, :bio, :location) }

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :username, :bio, :location) }
    end

end

