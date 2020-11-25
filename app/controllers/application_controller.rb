class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    return redirect_to new_user_session_path if current_user.nil?
    redirect_to profile_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :avatar])
  end
end
