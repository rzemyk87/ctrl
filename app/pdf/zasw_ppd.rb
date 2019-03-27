class ZaswPPD < Prawn::Document
  def initialize(osoba, szkol)
  	super()
    @osoba = osoba
    @szkolenie = szkol
      self.font_families.update("Geogrotesque"=>{:normal =>"app/assets/fonts/Geogrotesque-Rg.ttf",
                             :bold =>"app/assets/fonts/Geogrotesque-Sb.ttf"})
    font "Geogrotesque"  
    @data = @szkolenie.data_wystawienia
    @data1 = @szkolenie.created_at.strftime("/%Y")
    @data_od = @szkolenie.data_od.strftime("%d.%m.%Y")
    @data_do = @szkolenie.data_do.strftime("%d.%m.%Y")
    $licznik = @osoba.count - 1

	while $licznik >= 0 do

    logo
    organizator
    header
    plaster
    szkolony
    tekst
 	pieczatka
 	next_page
    tabela

    if $licznik > 0 
    	next_page
    end

   $licznik = $licznik - 1
end

  end

  def logo
	image "app/assets/images/control_logo_nowe.png", :scale => 0.5, :position => 420
  end

  def organizator
	text "(organizator kształcenia) ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 40
  end

 def plaster
	image "app/assets/images/pierwsza.png", :scale => 0.4, :position => :center
  end

  def pieczatka
  	move_down 40
	text " (pieczęć i podpis osoby upoważnionej", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 380
 	text " przez organizatora kształcenia) ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 390
  end

  def header
  		move_down 20
  		text "ZAŚWIADCZENIE", size: 20, :color => "009f4d", style: :bold, :indent_paragraphs => 60
 		move_down 5
  		text "o ukończeniu szkolenia z zakresu udzielania pierwszej pomocy przedmedycznej", size: 12, :indent_paragraphs => 60
  		move_down 10
  end

  def szkolony
    text "Pan(i): <b><color rgb='009f4d'>#{@osoba[$licznik].osoba_imie} #{@osoba[$licznik].osoba_nazwisko}</color></b>", :align => :left, size: 12, :indent_paragraphs => 60, :inline_format => true
   	move_down 5
  end

  def tekst
	text "Ukończył/a szkolenie Pierwsza Pomoc Dzieciom", size: 12, :indent_paragraphs => 60
	move_down 5
	text "zorganizowane przez Firmę Usługowo-Handlową Grzegorz Kobuszewski we Wrocławiu
w formie seminarium.", size: 12, :indent_paragraphs => 60
	text "Celem szkolenia było uzupełnienie wiedzy z zakresu udzielania Pierwszej Pomocy.", size: 12, :indent_paragraphs => 60
   	move_down 40


   	text "Zaświadczenie wydano na podstawie § 6 rozporządzenia Ministra Edukacji i Nauki z dnia 3 lutego 2006 r. ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
	text "w sprawie uzyskiwania i uzupełniania przez osoby dorosłe wiedzy ogólnej, umiejętności i kwalifikacji zawodowych", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
    text "w formach pozaszkolnych (Dz. U. Nr 31, poz. 216).", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
    move_down 20

	text "Wrocław, dnia #{@data}", :indent_paragraphs => 60, size: 12

	move_down 20
		text "Nr zaświadczenia wg rejestru #{@osoba[$licznik].nr_zaswiadczenia}/PPD/#{@szkolenie.szkolenie_id}#{@data1}", :indent_paragraphs => 60, size: 12
	
  end

def next_page
	start_new_page
end

def tabela
	bounding_box([50, 700], :width => 450, :height => 400) do
	 text "Program szkolenia:", :align => :left, size: 12, :indent_paragraphs => 46, :style => :bold
      move_down 10
		table tabela_zaw do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(1..5).columns(2).align = :center
		end

	end
end

def tabela_zaw
	[["Lp","Tematyka szkolenia","Wymiar godzin zajęć edukacyjnych"],
	["1.", "Stany zagrożenia życia, bezdech, monitorowanie oddechu", "30 minut"],
	["2.", "Ciało obce w drogach oddechowych wykład + ćwiczenia", "60 minut"],
    ["3.", "Resuscytacja krążeniowo oddechowa dzieci niemowląt","90 minut"],
    ["4.", "Resuscytacja krążeniowo oddechowa dorosłych", "30 minut"],
	["5.","Urazy, złamania, oparzenia – pierwsza pomoc", "30 minut"]]
end




end

