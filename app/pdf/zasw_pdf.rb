class ZaswPdf < Prawn::Document
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
    $licznik = @osoba.count - 1
 
while $licznik >= 0 do

	if @osoba[$licznik].nr_zaswiadczenia >= 1
	    logo
	    header
	    szkolony
	    tekst
	 	tekst1
	 	pieczatka
	 	next_page
	    logo
	    tematyka
	    tabela
	    stopka

	    if $licznik > 0 
	    	next_page
	    end

	end
		
		$licznik = $licznik - 1
end

  end

  def logo
	image "app/assets/images/control_bhp.png", :scale => 0.06, :position => 380
  end

  def pieczatka
  	move_down 30
	text " (pieczęć i podpis osoby upoważnionej", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 380
 	text " przez organizatora kształcenia) ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 390
  end

  def header
  		move_down 40
  		text "ZAŚWIADCZENIE", size: 18, :align => :center, style: :bold
 		move_down 5
  		text "o ukończeniu szkolenia w dziedzinie bezpieczeństwa i higieny pracy", size: 16, :align => :center, :style => :bold
  		move_down 10
  end

  def szkolony
  	move_down 20
  	text "Pan(i):", :align => :left, size: 12, :indent_paragraphs => 60
  	move_down 5
  	text "#{@osoba[$licznik].osoba_imie} #{@osoba[$licznik].osoba_nazwisko}", :align => :center, size: 18, :style => :bold
  	move_down 5
  	text "urodzony(a) dnia: #{@osoba[$licznik].osoba_data} r. w #{@osoba[$licznik].osoba_miejsce}", :align => :center, size: 12
  	move_down 5
  end

  def tekst
  	move_down 10
	text "ukończył(a):", :align => :left, size: 12, :indent_paragraphs => 60
	move_down 5
	
	if @osoba[$licznik].rodzaj_id == 1
		text "Szkolenie okresowe dla pracowników", size: 14, :align => :center, style: :bold
		move_down 1
	 	text "zatrudnionych na stanowiskach administracyjno-biurowych", size: 14, :align => :center, style: :bold
	elsif @osoba[$licznik].rodzaj_id == 2
		text "Szkolenie okresowe dla pracowników", size: 14, :align => :center, style: :bold
		move_down 1
		text "zatrudnionych na stanowiskach robotniczych", size: 14, :align => :center, style: :bold
	elsif @osoba[$licznik].rodzaj_id == 3
		text "Szkolenie okresowe dla pracowników", size: 14, :align => :center, style: :bold
		move_down 1
		text "zatrudnionych na stanowiskach inżynieryjno-technicznych", size: 14, :align => :center, style: :bold
	else
		text "Szkolenie okresowe", size: 14, :align => :center, style: :bold
		move_down 1
		text "dla pracodawców i osób kierujących pracownikami", size: 14, :align => :center, style: :bold
	end 

  end

 def tekst1

bounding_box([50, 400], :width => 450, :height => 300) do

	if @szkolenie.forma == "Seminarium"
		text "zorganizowane w formie seminarium przez #{@firma.tekst} w okresie od #{@data_od}r. do #{@data_do}r.", :align => :justify, size: 12
	elsif @szkolenie.forma == "Samokształcenie Kier."
		text "zorganizowane w formie samokształcenie kierowane przez #{@firma.tekst} w okresie od #{@data_od}r. do #{@data_do}r.", :align => :justify, size: 12
	elsif @szkolenie.forma == "Seminarium + SK"
		text "zorganizowane w formie seminarium oraz samokształcenie kierowane przez #{@firma.tekst} w okresie od #{@data_od}r. do #{@data_do}r.", :align => :justify, size: 12
	else
		text "zorganizowane w formie instruktażu przez #{@firma.tekst} w okresie od #{@data_od}r. do #{@data_do}r.", :align => :justify, size: 12	
	end

	move_down 15
	text "Celem szkolenia była aktualizacja, uzupełnienie wiedzy i umiejętności z zakresu:", :align => :justify, size: 12
	move_down 5
	if @osoba[$licznik].rodzaj_id == 1
		text "• oceny zagrożeń związanych z wykonywaną pracą,", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "• metod ochrony przed zagrożeniami dla zdrowia i bezpieczeństwa pracowników,", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "• kształtowania warunków pracy w sposób zgodny z przepisami i zasadami", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "bezpieczeństwa i higieny pracy, ", :align => :left, size: 12, :indent_paragraphs => 46
		move_down 5
		text "• postępowania w razie wypadku oraz w sytuacjach awaryjnych.", :align => :left, size: 12, :indent_paragraphs => 40
   	elsif @osoba[$licznik].rodzaj_id == 2
   		text "• przepisów i zasad bezpieczeństwa i higieny pracy związanych z wykonywaną pracą,", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "• zagrożeń związanych z wykonywaną pracą oraz metod ochrony", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "przed tymi zagrożeniami, ", :align => :left, size: 12, :indent_paragraphs => 46
		move_down 5
		text "• postępowania w razie wypadku i w sytuacjach zagrożeń.", :align => :left, size: 12, :indent_paragraphs => 40
   	elsif @osoba[$licznik].rodzaj_id == 3
   		text "• oceny zagrożeń występujących w procesach pracy oraz ryzyka", :align => :left, size: 12, :indent_paragraphs => 40
   		move_down 5
   		text "związanego z tymi zagrożeniami,", :align => :left, size: 12, :indent_paragraphs => 46
		move_down 5
		text "• kształtowania bezpiecznych i higienicznych warunków pracy,", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "• ochrony pracowników przed zagrożeniami związanymi z", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "wykonywaną pracą. ", :align => :left, size: 12, :indent_paragraphs => 46
	else
		text "• oceny zagrożeń występujących w procesach pracy oraz ryzyka", :align => :left, size: 12, :indent_paragraphs => 40
   		move_down 5
   		text "związanego z tymi zagrożeniami,", :align => :left, size: 12, :indent_paragraphs => 46
		move_down 5	
		text "• kształtowania bezpiecznych i higienicznych warunków pracy,", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "• ochrony pracowników przed zagrożeniami związanymi z", :align => :left, size: 12, :indent_paragraphs => 40
		move_down 5
		text "wykonywaną pracą. ", :align => :left, size: 12, :indent_paragraphs => 46
   	end

   	move_down 20

   	text "Zaświadczenie wydano na podstawie § 16 ust. 3 rozporządzenia Ministra Gospodarki i Pracy z dnia 27 lipca 2004 r. w sprawie szkolenia w dziedzinie bezpieczeństwa i higieny pracy (Dz. U. Nr 180,poz. 1860, z późn. zm.).", :align => :left
    
    move_down 20

	text "Wrocław, dnia #{@data}", :align => :left, size: 12

	move_down 20

	  if @osoba[$licznik].rodzaj_id == 1
		text "Nr zaświadczenia wg rejestru <b>#{@osoba[$licznik].nr_zaswiadczenia}/AB/#{@szkolenie.szkolenie_id}#{@data1}</b>", :align => :left, size: 12, :inline_format => true
      elsif @osoba[$licznik].rodzaj_id == 2	
   		text "Nr zaświadczenia wg rejestru <b>#{@osoba[$licznik].nr_zaswiadczenia}/R/#{@szkolenie.szkolenie_id}#{@data1}</b>", :align => :left, size: 12, :inline_format => true
      elsif @osoba[$licznik].rodzaj_id == 3
   		text "Nr zaświadczenia wg rejestru <b>#{@osoba[$licznik].nr_zaswiadczenia}/IT/#{@szkolenie.szkolenie_id}#{@data1}</b>", :align => :left, size: 12, :inline_format => true
      else
   		text "Nr zaświadczenia wg rejestru <b>#{@osoba[$licznik].nr_zaswiadczenia}/K/#{@szkolenie.szkolenie_id}#{@data1}</b>", :align => :left, size: 12, :inline_format => true
      end		

   end 
 end

def next_page
	start_new_page
end

def tematyka

end

def tabela
	bounding_box([50, 650], :width => 450, :height => 450) do
		text "Program szkolenia:", :align => :left, size: 12, :indent_paragraphs => 46, :style => :bold
	move_down 10
	if @osoba[$licznik].rodzaj_id == 1
		table tabela_zaw_ab do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(5).columns(0).borders = [:top, :right]
		row(1..5).columns(2).align = :center
		row(5).columns(1..2).font_style = :bold
		end
	elsif @osoba[$licznik].rodzaj_id == 2	
		table tabela_zaw_rob do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(5).columns(0).borders = [:top, :right]
		row(1..5).columns(2).align = :center
		row(5).columns(1..2).font_style = :bold
		end
	elsif @osoba[$licznik].rodzaj_id == 3
		table tabela_zaw_inz do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(5).columns(0).borders = [:top, :right]
		row(1..5).columns(2).align = :center
		row(5).columns(1..2).font_style = :bold
		end
	else
		table tabela_zaw_prac do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(9).columns(0).borders = [:top, :right]
		row(1..9).columns(2).align = :center
		row(1..9).columns(1).size = 9
		row(9).columns(1..2).font_style = :bold
		end
	end
	
	end
end

def tabela_zaw_ab
	[["Lp","Tematyka szkolenia", "Liczba godzin"],
	["1.", "   Wybrane regulacje prawne z zakresu prawa pracy dotyczące bezpieczeństwa i higieny pracy:
		   a) praw i obowiązków pracowników i pracodawców w zakresie gieny pracy,
		      z uwzględnieniem:
		         •  bezpieczeństwa i higieny pracy oraz odpowiedzialności za 
		            naruszenie przepisów i zasad bhp,
		   b) ochrony pracy kobiet i młodocianych, 
		   c) wypadków przy pracy i chorób zawodowych oraz świadczeń z nimi związanych", "2"],
	["2.", "   Postęp w zakresie oceny zagrożeń czynnikami występującymi w procesach 
		       pracy oraz w zakresie metod ochrony przed zagrożeniami dla zdrowia i życia pracowników", "2"],
    ["3.","Problemy związane z organizacją stanowisk pracy biurowej, z uwzględnieniem zasad ergonomii, w tym stanowisk wyposażonych w monitory ekranowe i inne urządzenia biurowe","2"],
     ["4.","Postępowanie w razie wypadków i w sytuacjach zagrożeń (np. pożaru, awarii), w tym zasady udzielania pierwszej pomocy w razie wypadku","2"],
        ["","Razem:","8"]]
end

def tabela_zaw_inz
	[["Lp","Tematyka szkolenia", "Liczba godzin"],
	["1.", "   Regulacje prawne z zakresu bezpieczeństwa i higieny pracy, 
		   z uwzględnieniem przepisów związanych z wykonywaną pracą", "1"],
	["2.", "   Zagrożenia czynnikami występującymi w procesach pracy
		   oraz zasady i metody likwidacji lub ograniczenia
	      oddziaływania tych czynników na pracowników z
	         uwzględnieniem zmian w technologii, organizacji pracy i
            stanowisk pracy, stosowania środków ochrony zbiorowej i
               indywidualnej, wprowadzenia nowych urządzeń, sprzętu i
                  narzędzi pracy", "3"],
    ["3.","Zasady postępowania w razie wypadku w czasie pracy i w
    	   sytuacjach zagrożeń (pożaru, awarii), w tym zasady
    	   udzielania pierwszej pomocy w razie wypadku","2"],
    ["4.","Okoliczności i przyczyny charakterystycznych
        dla wykonywanej pracy wypadków przy pracy oraz związana 
        z nimi profilaktyka","2"],
        ["","Razem:","8"]]
end

def tabela_zaw_rob
	[["Lp","Tematyka szkolenia", "Liczba godzin"],
	["1.", "   Regulacje prawne z zakresu bezpieczeństwa i higieny pracy, z uwzględnieniem przepisów związanych z wykonywaną pracą", "1"],
	["2.", "   Zagrożenia czynnikami występującymi w procesach pracy oraz zasady i metody likwidacji lub ograniczenia oddziaływania tych czynników na pracowników z uwzględnieniem zmian w technologii, organizacji pracy i stanowisk pracy, stosowania środków ochrony zbiorowej i indywidualnej, wprowadzenia nowych urządzeń, sprzętu i narzędzi pracy", "3"],
    ["3.","Zasady postępowania w razie wypadku w czasie pracy i w sytuacjach zagrożeń (pożaru, awarii), w tym zasady udzielania pierwszej pomocy w razie wypadku","2"],
    ["4.","Okoliczności i przyczyny charakterystycznych dla wykonywanej pracy wypadków przy pracy oraz związana z nimi profilaktyka","2"],
        ["","Razem:","8"]]
end

def tabela_zaw_prac
	[["Lp","Tematyka szkolenia", "Liczba godzin"],
	["1.", "Wybrane zagadnienia z prawa pracy, prawa międzynarodowego 
		(Dyrektywy WE, Konwencji MOP)
		  • odpowiedzialność za naruszenia przepisów BHP,
		  • ochrona pracy kobiet i młodocianych,
		  • profilaktyka opieki zdrowotnej,
		  • szkolenia w zakresie BHP,
		  • nadzór i kontrola warunków pracy", "3"],
	["2.", "Identyfikacja, analiza i ocena zagrożeń czynników szkodliwych dla zdrowia, uciążliwych i niebezpiecznych oraz ocena ryzyka związanego z tymi zagrożeniami", "3"],
    ["3.","Organizacja i metody kształtowania bezpiecznych i higienicznych warunków pracy","3"],
    ["4.","Analiza wypadków przy pracy i chorób zawodowych, profilaktyka, omówienie przyczyn wypadków","2"],
    ["5.","Organizacja i metodyka szkoleń w zakresie BHP z uwzględnieniem metod prowadzenia instruktażu stanowiskowego oraz kształtowanie bezpiecznych zachowań pracowników w procesie pracy","2"],
    ["6.","Zasady postępowania w razie wypadków w czasie pracy i w sytuacjach zagrożenia w tym zasady udzielania pierwszej pomocy przedlekarskiej ","1"],
    ["7.","Skutki ekonomiczne niewłaściwych warunków pracy","1"],
    ["8.","Ochrona przeciwpożarowa, ochrona środowiska","1"],
        ["","Razem:","16"]]
end

def stopka
move_down 150

   	text "1) Wpisać nazwę formy szkolenia zgodnie z § 13 ust. 1 oraz § 15 ust. 1 i 2 rozporządzenia Ministra Gospodarki i Pracy z dnia 27 lipca 2004 r. ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 30
	text "w sprawie szkolenia w dziedzinie bezpieczeństwa i higieny pracy (Dz. U. Nr 180, poz. 1860, z późn. zm.).", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 30
end



end

