class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

private

  def sprawdz_logowanie
  	unless session[:uzytkownik_id]
  		redirect_to(:controller => 'dostep', :action => 'login')
  		return false
  	else
  		return true
  	end
  end
end
