class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format =~ %r{application/json;} }
  # def after_sign_in_path_for(resource_or_scope)
  #   users_path
  # end

  # def after_sign_out_path_for(resource_or_scope)
  #   redirect_to new_user_session_path
  # end

  protected

  def configure_permitted_parameters
    attributes = %i[Name email password]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
