class ZaswPozar < Prawn::Document
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
	image "app/assets/images/control_bhp.png", :scale => 0.05, :position => 400
  end

  def organizator
	text "(organizator kształcenia) ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 40
  end

 def plaster
	image "app/assets/images/plaster.png", :scale => 0.5, :position => :center
  end

  def pieczatka
  	move_down 40
	text " (pieczęć i podpis osoby upoważnionej", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 380
 	text " przez organizatora kształcenia) ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 390
  end

  def header
  		move_down 20
  		text "ZAŚWIADCZENIE", size: 20, :color => "003da5", style: :bold, :indent_paragraphs => 60
 		move_down 5
  		text "o ukończeniu szkolenia z zakresu ochrony przeciwpożarowej", size: 12, :indent_paragraphs => 60
  		move_down 25
  end

  def szkolony
    move_down 40
    text "Pan(i): <b><color rgb='003da5'>#{@osoba[$licznik].osoba_imie} #{@osoba[$licznik].osoba_nazwisko}</color></b>", :align => :left, size: 12, :indent_paragraphs => 60, :inline_format => true
  	move_down 5
  end

  def tekst
  if @szkolenie.forma == "Instruktaż"
	text "Ukończył/a szkolenie z zakresu ochrony przeciwpożarowej", size: 12, :indent_paragraphs => 60
	move_down 5
	text "zorganizowane przez Firmę Usługowo-Handlową Grzegorz Kobuszewski we Wrocławiu
w formie Instruktażu.", size: 12, :indent_paragraphs => 60
	text "Celem szkolenia było uzupełnienie wiedzy z zakresu ochrony ppoż.", size: 12, :indent_paragraphs => 60
  else
   	text "Ukończył/a szkolenie z zakresu ochrony przeciwpożarowej", size: 12, :indent_paragraphs => 60
	move_down 5
	text "zorganizowane przez Firmę Usługowo-Handlową Grzegorz Kobuszewski we Wrocławiu
w formie Samokształcenia Kierowanego.", size: 12, :indent_paragraphs => 60
	text "Celem szkolenia było uzupełnienie wiedzy z zakresu ochrony ppoż.", size: 12, :indent_paragraphs => 60

   	move_down 40


   	text "Zaświadczenie wydano na podstawie § 6 rozporządzenia Ministra Edukacji i Nauki z dnia 3 lutego 2006 r. ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
	text "w sprawie uzyskiwania i uzupełniania przez osoby dorosłe wiedzy ogólnej, umiejętności i kwalifikacji zawodowych", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
    text "w formach pozaszkolnych (Dz. U. Nr 31, poz. 216).", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 60
    move_down 20

	text "Wrocław, dnia #{@data}", :indent_paragraphs => 60, size: 12

	move_down 20
		text "Nr zaświadczenia wg rejestru #{@osoba[$licznik].nr_zaswiadczenia}/PPOŻ/#{@szkolenie.szkolenie_id}#{@data1}", :indent_paragraphs => 60, size: 12
	
  end

def next_page
	start_new_page
end

def tabela
	bounding_box([50, 700], :width => 450, :height => 450) do
	 text "Program szkolenia:", :align => :left, size: 12, :indent_paragraphs => 46, :style => :bold
      move_down 10
		table tabela_zaw do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(1..10).columns(2).align = :center
		end

	move_down 5
   	text "    *Program zrealizowano w czasie 3 godzin", size: 12, :align => :left

	end
end

def tabela_zaw
	[["Lp","Tematyka szkolenia"],
	["1.", "Przepisy przeciwpożarowe dotyczące ochrony ppoż. budynków."],
	["2.", "Współpraca zakładów pracy z PSP."],
    ["3.", "Zasady organizacji zakładowego systemu ochrony ppoż."],
    ["4.", "Zagrożenia pożarowe obiektu oraz przyczyny powstawania i rozprzestrzeniania się pożaru.
"],
	["5.","Znaki ewakuacyjne oraz przeciwpożarowe."],
	["6.", "Systemy oraz sprzęt ochrony ppoż. "],
	["7.", "Postępowanie na wypadek powstania pożaru."],
	["8.", "Ogólne zasady postępowania w sytuacjach nadzwyczajnych / kataklizm/zamach terrorystyczny."],
	["9.", "Sposoby ewakuacji ludzi i mienia na wypadek powstania pożaru oraz sposoby postępowania do czasu przybycia jednostek ratowniczo - gaśniczych."],
	["10.", "Rozmieszczenie i obsługa stałych urządzeń gaśniczych oraz podręcznego sprzętu gaśniczego"],
	["11.", "Pierwsza pomoc przy poparzeniach i zatruciach gazami."]]
end

end


end

