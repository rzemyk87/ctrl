class KursesController < ApplicationController

  layout 'admin'

  before_action :sprawdz_uzytkownika
  before_action :sprawdz_logowanie
  before_action :szukaj


  def nowy
    if params[:tytul]
      @tytul = Rodzaj.find(params[:tytul]).rodzaj
    end

  	if @szkol.blank?
  		@kursy_b = Osoba.sortuj
      @data_sz = @szkol.created_at.strftime("%Y")
  	else
  		@kursy_b = @szkol.osobas.sortuj
      @data_sz = @szkol.created_at.strftime("%Y")
  	end
  end

  def index

  search_firma = params[:search_firma]
  search_prowadzacy = params[:search_prowadzacy]
  search_imie = params[:search_imie]
  search_nazwisko = params[:search_nazwisko]
  search_data = params[:search_data]


  kursy = Szkolenie.where(:firma_id => @current_user.firma_id).joins(:osobas)

  if params[:search_firma || :search_prowadzacy || :search_data || :search_imie || :search_nazwisko]
    @kursy = kursy.search(search_firma, search_prowadzacy, search_data, search_imie, search_nazwisko).order("created_at DESC").distinct
  else
    @kursy = kursy.order("created_at DESC").distinct
  end    


  end

def pdf
    
  if params[:id_osoba]
    @osoba = Osoba.joins(:szkolenie).find(params[:id_osoba])
    @szkol1 = Szkolenie.find(params[:id_szkol])
    @data = @osoba.created_at.strftime("%Y")
  end

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::ABPdf.new(@osoba, @szkol1)
      send_data pdf.render, filename: "#{@osoba.nr_zaswiadczenia}/#{@szkol1.szkolenie_id}/#{@data}.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end

def pierwsza_pdf
    
  if params[:id_osoba]
    @osoba = Osoba.joins(:szkolenie).find(params[:id_osoba])
    @szkol1 = Szkolenie.find(params[:id_szkol])
    @data = @osoba.created_at.strftime("%Y")
  end

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::PierwszaPdf.new(@osoba, @szkol1)
      send_data pdf.render, filename: "#{@osoba.nr_zaswiadczenia}/#{@szkol1.szkolenie_id}/#{@data}.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end

def dzieci_pdf
    
  if params[:id_osoba]
    @osoba = Osoba.joins(:szkolenie).find(params[:id_osoba])
    @szkol1 = Szkolenie.find(params[:id_szkol])
    @data = @osoba.created_at.strftime("%Y")
  end

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::DzieciPdf.new(@osoba, @szkol1)
      send_data pdf.render, filename: "#{@osoba.nr_zaswiadczenia}/#{@szkol1.szkolenie_id}/#{@data}.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end

def dziennik_pdf
    
  @szkol = Szkolenie.find(params[:id])
  @osoba = @szkol.osobas

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::DziennikPdf.new(@osoba, @szkol)
      send_data pdf.render, filename: "dziennik obecnosci.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end


def dziennik_pp
    
  @szkol = Szkolenie.find(params[:id])
  @osoba = @szkol.osobas

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::DziennikPP.new(@osoba, @szkol)
      send_data pdf.render, filename: "dziennik obecnosci.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end

def dziennik_ppd
    
  @szkol = Szkolenie.find(params[:id])
  @osoba = @szkol.osobas

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::DziennikPPD.new(@osoba, @szkol)
      send_data pdf.render, filename: "dziennik obecnosci.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end

def zaswiadczenia_pdf
    
  @szkol = Szkolenie.find(params[:id])
  @osoba = @szkol.osobas

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::ZaswPdf.new(@osoba, @szkol)
      send_data pdf.render, filename: "zaswiadczenia.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end

def zaswiadczenia_pp
    
  @szkol = Szkolenie.find(params[:id])
  @osoba = @szkol.osobas

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::ZaswPP.new(@osoba, @szkol)
      send_data pdf.render, filename: "zaswiadczenia.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end

def zaswiadczenia_ppd
    
  @szkol = Szkolenie.find(params[:id])
  @osoba = @szkol.osobas

  require 'prawn'
      
  respond_to do |format|
    format.html
    format.pdf do
    pdf = ::ZaswPPD.new(@osoba, @szkol)
      send_data pdf.render, filename: "zaswiadczenia.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
  end

end

def dokument

    @szkol = Szkolenie.find(params[:id])
    @osoba = Osoba.joins(:szkolenie).find(params[:id_osoba])
    @data = @osoba.created_at.strftime("%Y")

    respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"#{@osoba.nr_zaswiadczenia}/#{@szkol.szkolenie_id}/#{@data}.docx\"" }
    end
end

def pierwszapomoc

    @szkol = Szkolenie.find(params[:id])
    @osoba = Osoba.joins(:szkolenie).find(params[:id_osoba])
    @data = @osoba.created_at.strftime("%Y")

    respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"#{@osoba.nr_zaswiadczenia}/#{@szkol.szkolenie_id}/#{@data}.docx\"" }
    end
end

def dziecipomoc

    @szkol = Szkolenie.find(params[:id])
    @osoba = Osoba.joins(:szkolenie).find(params[:id_osoba])
    @data = @osoba.created_at.strftime("%Y")

    respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"#{@osoba.nr_zaswiadczenia}/#{@szkol.szkolenie_id}/#{@data}.docx\"" }
    end
end


def edycja
    @szkolenie = Szkolenie.find(params[:id])
end

def aktualizuj
    @szkolenie = Szkolenie.find(params[:id])
     if @szkolenie.update_attributes(szkolenie_parametry)
            flash[:notice] = "Szkolenie zaktualizowane"
      redirect_to(:action=>'nowy', :id => @szkolenie.id)
    else
      @szkolenie = Szkolenie.order('id DESC')
      render('edycja')
    end
end

def edycja_osoba
    @osoba = Osoba.find(params[:id_osoba])
end

def aktualizuj_osobe
  @osoba = Osoba.find(params[:id_osoba])
  @szkolenie = Szkolenie.find(params[:id])
    if @osoba.update_attributes(osoba_parametry)
        flash[:notice] = "zaktualizowano dane"
      redirect_to(:action=>'nowy', :id => @szkolenie.id)
    else
      render('edycja_osoba')
    end
end

def usun
    @szkolenie = Szkolenie.find(params[:id])
  end

def kasuj
    @szkolenie = Szkolenie.find(params[:id]).destroy

    @osoba = @szkol.osobas
    @osoba.each do |post| 
      post.destroy
    end

    flash[:notice] = "Szkolenie '#{@szkolenie.szkolenie_id}' usunięto"
    redirect_to(:action => 'index')
end

def usun_osoba
    @osoba = Osoba.find(params[:id_osoba])
end

def kasuj_osobe
    @osoba = Osoba.find(params[:id_osoba]).destroy
    @szkolenie = Szkolenie.find(params[:id])
    flash[:notice] = "Osobę '#{@osoba.osoba_imie} #{@osoba.osoba_nazwisko}' usunięto"
    redirect_to(:action => 'nowy', :id => @szkol.id)
end

def dodaj
    @szkolenie = Szkolenie.find(params[:id])
end

def dodaj
    @szkolenie = Szkolenie.find(params[:id])

    nr_zasw_b = Osoba.limit(1).where(szkolenie_id: @szkolenie.id).order('nr_zaswiadczenia desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    @nr = nr_zasw_b.at(0) + 1

end

def dodaj_osobe
  @osoba = Osoba.new(osoba_parametry_dodaj)

  if @osoba.save
      redirect_to(:action=> 'nowy', :id => @szkol.id)
  else
      render('nowy')
  end

end

private

def sprawdz_uzytkownika
    @current_user = Uzytkownik.find_by_id(session[:uzytkownik_id])
end

def szukaj
    if params[:id]
      @szkol = Szkolenie.find(params[:id])
    end
end

def sprawdz

  @osoba = @szkol.osobas
  $licznik = @osoba.count - 1

end

def szkolenie_parametry
    params.require(:szkolenie).permit(:szkolenie_id,:prowadzacy,:firma,:forma,:data_waznosci,:data_od,:data_do,:rodzaj_id, :data_wystawienia)
end

def osoba_parametry
    params.require(:osoba).permit(:osoba_imie,:osoba_nazwisko,:osoba_data,:osoba_miejsce,:osoba_ocena)
end

def osoba_parametry_dodaj
    params.require(:osoba).permit(:osoba_imie,:osoba_nazwisko,:osoba_data,:osoba_miejsce,:osoba_ocena,:szkolenie_id,:nr_zaswiadczenia, :rodzaj_id)
end


end
