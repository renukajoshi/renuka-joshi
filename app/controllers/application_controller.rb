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

before_action :configure_permitted_parameters , if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name ,:email,:password ,:birthdate,:gender,:country )}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email , :password)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name ,:email,:password,:birthdate,:gender,:country )}
    
  end
end
