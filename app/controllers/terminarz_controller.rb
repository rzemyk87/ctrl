class TerminarzController < ApplicationController

layout 'admin'

  before_action :sprawdz_uzytkownika
  before_action :sprawdz_logowanie

def index
	@osoby = Osoba.joins(:szkolenie).where('data_waznosci BETWEEN ? AND ?',DateTime.now, DateTime.now+60).where('firma_id = ?', session[:firma_id]).where(:confirm => false).order("data_waznosci ASC")
end
 
def terminarz

  search_firma = params[:search_firma]
  search_prowadzacy = params[:search_prowadzacy]
  search_imie = params[:search_imie]
  search_nazwisko = params[:search_nazwisko]
  search_data = params[:search_data] 
  search_data_waznosci = params[:search_data_waznosci]

  kursy = Szkolenie.where(:firma_id => @current_user.firma_id).where.not(:rodzaj_id => 8).where.not(data_waznosci: nil).joins(:osobas)

  if params[:search_firma || :search_prowadzacy || :search_data || :search_imie || :search_nazwisko || :search_data_waznosci]
    @kursy = kursy.search(search_firma, search_prowadzacy, search_data, search_imie, search_nazwisko, search_data_waznosci).order("data_waznosci ASC").distinct
  else 
    @kursy = kursy.order("data_waznosci ASC").distinct
  end    

end
 
def confirm
	@osoba = Osoba.find(params[:id])
	@osoba.confirm = true
	@osoba.save!
      redirect_to(:action => "index")
end

private

def sprawdz_uzytkownika
    @current_user = Uzytkownik.find_by_id(session[:uzytkownik_id])
end

def osoba_parametry
	params.require(:osoba).permit(:confirm)
end

end
