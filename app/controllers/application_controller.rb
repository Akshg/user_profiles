class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    return redirect_to new_user_session_path if current_user.nil?
    render html: "<h1>Hii! #{current_user.name}</h1>".html_safe
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
  end
end
