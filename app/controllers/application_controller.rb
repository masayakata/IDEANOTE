
class ApplicationController < ActionController::Base

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:accout_update) {
			|u| u.permit(:name, :image, :current_password) }
	end

	def after_sign_in_path_for(resource)
    	'/entrepreneurs'
  	end

	def configure_permitted_parameters
   	 devise_parameter_sanitizer.for(:sign_up) << :role
	end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
