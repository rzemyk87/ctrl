class TerminarzController < ApplicationController

layout 'admin'

  before_action :sprawdz_uzytkownika
  before_action :sprawdz_logowanie

def index
	@osoby = Osoba.joins(:szkolenie).where('data_waznosci BETWEEN ? AND ?',DateTime.now, DateTime.now+60).where('firma_id = ?', session[:firma_id]).order("data_waznosci ASC")
end

private

def sprawdz_uzytkownika
    @current_user = Uzytkownik.find_by_id(session[:uzytkownik_id])
end

end
