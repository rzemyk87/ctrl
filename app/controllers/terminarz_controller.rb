class TerminarzController < ApplicationController

layout 'admin'

  before_action :sprawdz_uzytkownika
  before_action :sprawdz_logowanie

def index
	@szkolenia = Szkolenie.where(:firma_id => @current_user.firma_id).where('data_waznosci BETWEEN ? AND ?',DateTime.now, DateTime.now+30).joins(:osobas)
end

private

def sprawdz_uzytkownika
    @current_user = Uzytkownik.find_by_id(session[:uzytkownik_id])
end

end
