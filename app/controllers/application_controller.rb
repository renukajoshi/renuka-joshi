class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_action :authenticate_user! , except: [:show , :index ]

 #layout "home"

  #private
  #def current_user
    #@current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
 #end
  #helper_method :current_user


  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end

end
