# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email zip_code address profile])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email zip_code address profile])
  end
end
