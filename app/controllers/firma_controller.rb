class FirmaController < ApplicationController

layout 'admin'
  
  def index
  	@firma = Firma.find_by_id(session[:firma_id])
  end
  
  def aktualizuj
  	@firma = Firma.find_by_id(session[:firma_id])
    @firma.avatar.attach(params[:avatar])
  	if @firma.update_attributes(firma_parametry)
      flash[:notice] = "Dane firmy pomyślnie zmodyfikowane"
      redirect_to(:action => "index")

    end 
  end

  def click
    redirect_to(:action => "index")
  end

 private
 
def firma_parametry
    params.require(:firma).permit(:firma_id,:Nazwa,:log_in,:NIP,:adres,:poczta,:miasto,:tekst,:avatar)
end
end
