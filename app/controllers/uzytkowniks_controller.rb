class UzytkowniksController < ApplicationController

layout 'admin'

before_action :sprawdz_uzytkownika
before_action :sprawdz_logowanie


def confirm_email
    uzytkownik = Uzytkownik.find_by_confirm_token(params[:token])
    if uzytkownik
      uzytkownik.email_activate
      redirect_to(:action => "index")
    else
      flash[:notice] = "Użytkownik nie istnieje"
      redirect_to( :controller => 'dostep', :action=> 'index')
    end
end

  def index
    @uzytkownik = Uzytkownik.where(:firma_id => @current_user.firma_id, :email_confirmed => true).sortuj
  end

  def nowy
        @uzytkownik = Uzytkownik.new
  end

  def utworz
    @uzytkownik = Uzytkownik.new(uzytkownik_parametry)
    if @uzytkownik.save
      UserMailer.registration_confirmation(@uzytkownik).deliver
      flash[:notice] = "Wysłaliśmy link aktywacyjny na Twojego maila, potwierdź go by kontynuować"
      redirect_to(:action => "index")
    else
      flash[:notice] = "Ooooppss, coś poszło nie tak! Skontaktuj się z Nami, by rozwiązać problem :)"
      render("index")
    end
  end

  def edycja
    @uzytkownik = Uzytkownik.find(params[:id])
  end

  def aktualizuj
    @uzytkownik = Uzytkownik.find(params[:id])
    if @uzytkownik.update_attributes(uzytkownik_parametry)
      flash[:notice] = "Dane użytkownika pomyślnie zmodyfikowane"
      redirect_to(:action => "index")
    else
      render("edycja")
    end
  end

  def usun
        @uzytkownik = Uzytkownik.find(params[:id])
  end

  def kasuj
      uzytkownik = Uzytkownik.find(params[:id]).destroy
      flash[:notice] = "Konto Użytkownika #{uzytkownik.uzytkownik} zostało usunięte"
      redirect_to(:action => "index")
  end

private

def sprawdz_uzytkownika
    @current_user = Uzytkownik.find_by_id(session[:uzytkownik_id])
end

  def uzytkownik_parametry
      params.require(:uzytkownik).permit(:imie, :nazwisko, :email, :uzytkownik, :password, :password_confirmation, :firma_id, :email_confirmed, :confirm_token)
  end
end
