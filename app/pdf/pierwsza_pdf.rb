class PierwszaPdf < Prawn::Document
  def initialize(osoba, szkol, firma)
  	super()
    @osoba = osoba
    @szkolenie = szkol
    @firma = firma
      self.font_families.update("Geogrotesque"=>{:normal =>"app/assets/fonts/Geogrotesque-Rg.ttf",
                             :bold =>"app/assets/fonts/Geogrotesque-Sb.ttf"})
    font "Geogrotesque"  
    @data = @szkolenie.data_wystawienia
    @data1 = @szkolenie.created_at.strftime("/%Y")
    @data_od = @szkolenie.data_od.strftime("%d.%m.%Y")
    @data_do = @szkolenie.data_do.strftime("%d.%m.%Y")
    logo
    organizator
    header
    plaster
    szkolony
    tekst
 	pieczatka
 	next_page
    tabela

  end
 
  def logo
	image "app/assets/images/control_logo_nowe.png", :scale => 0.5, :position => 420
  end

  def organizator
	text "(organizator kształcenia) ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 40
  end

 def plaster
	image "app/assets/images/plaster.png", :scale => 0.5, :position => :center
  end

  def pieczatka
  move_down 20
	text " (pieczęć i podpis osoby upoważnionej", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 380
 	text " przez organizatora kształcenia) ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 390
  end

  def header
  		move_down 20
  		text "ZAŚWIADCZENIE", size: 20, :color => "009f4d", style: :bold, :indent_paragraphs => 60
 		move_down 5
  		text "o ukończeniu szkolenia z zakresu udzielania pierwszej pomocy przedmedycznej", size: 12, :indent_paragraphs => 60
  		move_down 25
  end

  def szkolony
    move_down 40
  	text "Pan(i): <b><color rgb='009f4d'>#{@osoba.osoba_imie} #{@osoba.osoba_nazwisko}</color></b>", :align => :left, size: 12, :indent_paragraphs => 60, :inline_format => true
    move_down 5
  end

  def tekst
	text "Ukończył/a szkolenie Pierwsza Pomoc Przedmedyczna", size: 12, :indent_paragraphs => 60
	move_down 5
	text "zorganizowane przez #{@firma.tekst}
w formie seminarium.", size: 12, :indent_paragraphs => 60
	text "Celem szkolenia było uzupełnienie wiedzy z zakresu udzielania Pierwszej Pomocy.", size: 12, :indent_paragraphs => 60
   	move_down 40


   	text "Zaświadczenie wydano na podstawie § 6 rozporządzenia Ministra Edukacji i Nauki z dnia 3 lutego 2006 r. ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
	text "w sprawie uzyskiwania i uzupełniania przez osoby dorosłe wiedzy ogólnej, umiejętności i kwalifikacji zawodowych", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
    text "w formach pozaszkolnych (Dz. U. Nr 31, poz. 216).", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
    move_down 20

	text "Wrocław, dnia #{@data}", :indent_paragraphs => 60, size: 12

	move_down 20
		text "Nr zaświadczenia wg rejestru #{@osoba.nr_zaswiadczenia}/PP/#{@szkolenie.szkolenie_id}#{@data1}", :indent_paragraphs => 60, size: 12
	
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
		row(1..10).columns(2).align = :center
		end

	move_down 5
    if @szkolenie.forma == "4 godzinne"
   	text "    *Program zrealizowano w czasie 4 godzin", size: 12, :align => :left
  	else
  	text "    *Program zrealizowano w czasie 8 godzin", size: 12, :align => :left
  	end

	end
end

def tabela_zaw
	[["Lp","Tematyka szkolenia"],
	["1.", "Zasady bezpieczeństwa"],
	["2.", "Ewakuacja i transport poszkodowanego"],
    ["3.", "Zaopatrywanie krwawień, ran ciętych, miażdżonych, stabilizacja ciała obcego"],
    ["4.", "Omdlenia a utrata przytomności, umiejętne rozpoznanie, postępowanie
"],
	["5.","Uraz kręgosłupa – stabilizacja, zaopatrzenie poszkodowanego urazowego
"],
	["6.", "Unieruchamianie złamań – postępowanie w przypadku urazów "],
	["7.", "Postępowanie w stanach zagrożenia życia"],
	["8.", "Resuscytacja krążeniowo – oddechowa z użyciem AED"],
	["9.", "Zadławienia"],
	["10.", "Postępowanie w stanach drgawkowych – mechanizm, objawy, pierwsza pomoc"]]

end




end

