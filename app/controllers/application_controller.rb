class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :authenticate_user!, notice: 'Vous devez vous connecter pour accéder à ce contenu'


  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u|
    u.permit(
             :first_name,
             :last_name,
             :username,
             :email,
             :password,
             :password_confirmation
             )
           }
  end
end
