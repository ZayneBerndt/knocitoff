class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError do |exception|
  redirect_to root_url, alert: exception.message
end

def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
    super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
   protected

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
