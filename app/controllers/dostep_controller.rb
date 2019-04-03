class DostepController < ApplicationController

layout 'admin'

before_action :szukaj
before_action :sprawdz_logowanie, :except => [:login, :logowanie, :logout]

  def login
  end

  def logowanie
  	if params[:uzytkownik].present? && params[:haslo].present? && params[:firma].present?
      if @firma.blank?
      flash[:notice] = "Nie ma takiej firmy w bazie"
      else
  		admin_szukam = Uzytkownik.where(:uzytkownik => params[:uzytkownik], :firma_id => @firma.firma_id).first
  		end
      if admin_szukam
  			admin_autoryzacja = admin_szukam.authenticate(params[:haslo])
  		end
  	end
  	
  	if admin_autoryzacja
  		session[:uzytkownik_id] = admin_autoryzacja.id
  		session[:uzytkownik] = admin_autoryzacja.uzytkownik
      session[:firma_id] = admin_autoryzacja.firma_id
      session[:log_in] = @firma.log_in
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] = "Błąd logowania - Zły login, firma lub hasło"
  		redirect_to(:action => 'login')
  	end
  end

  def logout
  	session[:uzytkownik_id] = nil
  	session[:uzytkownik] =nil
    session[:firma_id] = nil
  	redirect_to(:action => 'login')
  end

private

def szukaj
  if params[:firma]
      @firma = Firma.where(:log_in => params[:firma]).first
  end
end


  			
end
