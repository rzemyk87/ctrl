class SzkoleniasController < ApplicationController

  layout 'admin'

  before_action :sprawdz_uzytkownika
  before_action :sprawdz_logowanie

  def biurowe

    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new
    @osoba = @szkolenie.osobas

    szkolenie_last1 = Szkolenie.where(:firma_id => @current_user.firma_id).limit(1).order('szkolenie_id desc').pluck(:szkolenie_id).map(&:to_i)
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end
    #nr_zasw_b = Osoba.limit(1).where(rodzaj_id: 1).order('created_at desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    $nr = 1
    $l = 0
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end
  end
  
  def index
    @szkolenie = Szkolenie.sortuj
  end

  def nowe
    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new
    @licznik = Szkolenie.count + 1
  end

  def utworz
    @szkolenie = Szkolenie.new(nowe_parametry)

    if !Szkolenie.exists?(:szkolenie_id => @szkolenie.szkolenie_id)

      if @szkolenie.save
        redirect_to( :controller => 'kurses', :action=> 'nowy', :id => @szkolenie.id, :tytul => @szkolenie.rodzaj_id)
      else
        @licznik = Szkolenie.count + 1
        render('index')
      end

    else

      until !Szkolenie.exists?(:szkolenie_id => @szkolenie.szkolenie_id)
        @szkolenie.szkolenie_id = @szkolenie.szkolenie_id + 1
      end

      @szkolenie.save

      if @szkolenie.save
        redirect_to( :controller => 'kurses', :action=> 'nowy', :id => @szkolenie.id, :tytul => @szkolenie.rodzaj_id)
      else
        @licznik = Szkolenie.count + 1
        render('index')
      end

    end

  end


  def pierwsza

    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new

    szkolenie_last1 = Szkolenie.where(:firma_id => @current_user.firma_id).limit(1).order('szkolenie_id desc').pluck(:szkolenie_id).map(&:to_i)
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end

    #nr_zasw_i = Osoba.limit(1).where(rodzaj_id: 3).order('created_at desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    @nr = 1
  end

  def dzieci

    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new

    szkolenie_last1 = Szkolenie.where(:firma_id => @current_user.firma_id).limit(1).order('szkolenie_id desc').pluck(:szkolenie_id).map(&:to_i)
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end


    #nr_zasw_i = Osoba.limit(1).where(rodzaj_id: 3).order('created_at desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    @nr = 1
  end

  def inzynieryjne

    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new

    szkolenie_last1 = Szkolenie.where(:firma_id => @current_user.firma_id).limit(1).order('szkolenie_id desc').pluck(:szkolenie_id).map(&:to_i)
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end

    #nr_zasw_i = Osoba.limit(1).where(rodzaj_id: 3).order('created_at desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    $nr = 1
    $l = 0
  end

  def robotnicze

    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new

    szkolenie_last1 = Szkolenie.where(:firma_id => @current_user.firma_id).limit(1).order('szkolenie_id desc').pluck(:szkolenie_id).map(&:to_i)
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end

    @data1 = Date.today.years_since(1).strftime("%d/%m/%Y")
    @data2 = Date.today.years_since(3).strftime("%d/%m/%Y")

    #nr_zasw_r = Osoba.limit(1).where(rodzaj_id: 2).order('created_at desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    $nr = 1
    $l = 0
  end

  def nowe_robotnicze
    @robotnicze = Robotnicze.new()
    @robotnicze.robotnicies.new
    @licznik =  Robotnicze.count + 1
  end
 
  def pracodawcow

    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new

    szkolenie_last1 = Szkolenie.where(:firma_id => @current_user.firma_id).limit(1).order('szkolenie_id desc').pluck(:szkolenie_id).map(&:to_i)
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end

    #nr_zasw_p = Osoba.limit(1).where(rodzaj_id: 4).order('created_at desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    $nr = 1
    $l = 0
  end

  def pozar

    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new

    szkolenie_last1 = Szkolenie.where(:firma_id => @current_user.firma_id).limit(1).order('szkolenie_id desc').pluck(:szkolenie_id).map(&:to_i)
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end

    #nr_zasw_i = Osoba.limit(1).where(rodzaj_id: 3).order('created_at desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    @nr = 1
  end

  def wstepne

    @szkolenie = Szkolenie.new()
    @szkolenie.osobas.new

    szkolenie_last1 = Szkolenie.where(:rodzaj_id => '8').where(:firma_id => @current_user.firma_id).limit(1).order('szkolenie_id desc').pluck(:szkolenie_id).map(&:to_i)
    if szkolenie_last1.blank?
        @szkolenie_last = 1
    else
        @szkolenie_last = szkolenie_last1.at(0) + 1
    end

    @data1 = Date.today.months_since(6).strftime("%d/%m/%Y")
    @data2 = Date.today.years_since(1).strftime("%d/%m/%Y")

    #nr_zasw_i = Osoba.limit(1).where(rodzaj_id: 3).order('created_at desc').pluck(:nr_zaswiadczenia).map(&:to_i)
    @nr = 1
  end

private

def nowe_parametry
    params.require(:szkolenie).permit(:szkolenie_id,:prowadzacy,:firma,:forma,:data_waznosci,:data_od,:data_do,:rodzaj_id,:data_wystawienia, :firma_id, :osobas_attributes => [:id, :osoba_imie, :osoba_nazwisko, :osoba_data, :osoba_miejsce, :osoba_ocena,:rodzaj_id, :nr_zaswiadczenia, :stanowisko])
end

def sprawdz_uzytkownika
    @current_user = Uzytkownik.find_by_id(session[:uzytkownik_id])
end


end
