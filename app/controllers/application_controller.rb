class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday ])
  end

  # before_action :authenticate_user!


  private
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end
end
