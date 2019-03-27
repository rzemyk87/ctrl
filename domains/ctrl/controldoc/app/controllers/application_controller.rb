class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
