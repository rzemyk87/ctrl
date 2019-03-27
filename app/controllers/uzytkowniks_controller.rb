class UzytkowniksController < ApplicationController

layout 'admin'

before_action :sprawdz_uzytkownika
before_action :sprawdz_logowanie

  def index
    @uzytkownik = Uzytkownik.where(:firma_id => @current_user.firma_id).sortuj
  end

  def nowy
        @uzytkownik = Uzytkownik.new
  end

  def utworz
    @uzytkownik = Uzytkownik.new(uzytkownik_parametry)
    if @uzytkownik.save
      flash[:notice] = "Użytkownik założony"
      redirect_to(:action => "index")
    else
      render("nowy")
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
      params.require(:uzytkownik).permit(:imie, :nazwisko, :email, :uzytkownik, :password, :password_confirmation, :firma_id)
  end
end
