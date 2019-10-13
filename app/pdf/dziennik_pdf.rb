class DziennikPdf < Prawn::Document
  def initialize(osoba, szkol)
  	super()
  	@osoba = osoba
    @szkolenie = szkol
      self.font_families.update("Geogrotesque"=>{:normal =>"app/assets/fonts/Geogrotesque-Rg.ttf",
      											 :bold =>"app/assets/fonts/Geogrotesque-Sb.ttf"})
    font "Geogrotesque" 
    @data = @szkolenie.created_at.strftime("%d.%m.%Y")
    @data1 = @szkolenie.created_at.strftime(".%m.%Y")
    @data2 = @szkolenie.created_at.strftime("/%Y")
    @data_od = @szkolenie.data_od.strftime("%d.%m.%Y")
    @data_do = @szkolenie.data_do.strftime("%d.%m.%Y")
    @ilosc_dni = (@szkolenie.data_do - @szkolenie.data_od).to_i
    
    if @ilosc_dni <= 0
    	@dni = ""
    else
    	@dni = @ilosc_dni
    end 
     
    firma
    nr_kursu
    head
	dane_kursu
	program
	tabela
	next_page
	tekst
	tabela2
	podsumowanie
	organizator
	oceny

  end

  def osoby
  	@osoba.each do |osoba| 
      text "#{osoba.osoba_imie} #{osoba.osoba_nazwisko}"
    end
  end

  def firma
	bounding_box([30, 700], :width => 200, :height => 75) do
		text "Firma:", size: 16, :align => :left, style: :bold
		text "#{@szkolenie.firma}", size: 14, :align => :left, style: :normal, :overflow => :shrink_to_fit
	end
  end

  def nr_kursu
	bounding_box([450, 700], :width => 90, :height => 75) do

		text "NR KURSU:", size: 16, :align => :center, style: :bold
		stroke_rectangle [7, 58], 80, 20
		text_box "#{@szkolenie.szkolenie_id}#{@data2}",:at => [7, 55], :align => :center, size: 14, style: :bold
	
	end
  end

  def head
  		move_down 5
  		text "DZIENNIK ZAJĘĆ – SZKOLEŃ", size: 24, :align => :center, style: :bold
 		move_down 5
  		text "Z zakresu bezpieczeństwa i higieny pracy", size: 22, :align => :center, style: :bold
  		move_down 15
  end

  def dane_kursu
	bounding_box([50, 550], :width => 430, :height => 120) do
	stroke_bounds
		bounding_box([0, 120], :width => 215, :height => 40) do
		stroke_bounds
		move_down 10
		text "NAZWA KURSU:", :align => :center, size: 14, style: :bold
		end

		bounding_box([0, 80], :width => 215, :height => 40) do
		stroke_bounds
		move_down 5
		text "Forma kształcenia:", :align => :center, size: 14, style: :bold
		  if @szkolenie.forma == "Seminarium"
			text "Seminarium", :align => :center, size: 12
		  elsif @szkolenie.forma == "Samokształcenie Kier."
			text "Samokształcenie Kierowane", :align => :center, size: 12
		  elsif @szkolenie.forma == "Seminarium + SK"
			text "Seminarium + Samokształcenie kierowane", :align => :center, size: 12
		  elsif @szkolenie.forma == "Kurs"
			text "Kurs", :align => :center, size: 12
		  else
			text "Instruktaż", :align => :center, size: 14
		  end
		end

		bounding_box([215, 120], :width => 215, :height => 80) do
		stroke_bounds
		move_down 20
		  if @szkolenie.rodzaj_id == 1
			text "Szkolenie pracowników administracyjno - biurowych", :align => :center, size: 14
		  elsif @szkolenie.rodzaj_id == 2
			text "Szkolenie pracowników zatrudnionych na stanowiskach robotniczych", :align => :center, size: 14
		  elsif @szkolenie.rodzaj_id == 3
			text "Szkolenie pracowników inżynieryjno-technicznych", :align => :center, size: 14
		  else
			text "Szkolenie pracodawców i osób kierujących pracownikami", :align => :center, size: 14
		  end
		end

		bounding_box([0, 40], :width => 430, :height => 40) do
		stroke_bounds
		move_down 10
		text "Czas trwania kursu od: #{@data_od} r. do #{@data_do} r.", :align => :center, size: 14
		end

	end
  end

def program

	move_down 15
	
	if @szkolenie.rodzaj_id == 1
		text "Program dla pracowników administracyjno - biurowych", :align => :left, size: 14, :indent_paragraphs => 50
	elsif @szkolenie.rodzaj_id == 2
		text "Program dla pracowników zatrudnionych na stanowiskach robotniczych", :align => :left, size: 14, :indent_paragraphs => 50
	elsif @szkolenie.rodzaj_id == 3
		text "Program dla pracowników inżynieryjno-technicznych", :align => :left, size: 14, :indent_paragraphs => 50
	else
		text "Program dla pracodawców i osób kierujących pracownikami", :align => :left, size: 14, :indent_paragraphs => 50
	end

	move_down 15
end

def next_page
	start_new_page
end

def tabela
	bounding_box([50, 380], :width => 450, :height => 400) do

	if @szkolenie.rodzaj_id == 1
		table tabela_zaw_ab do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(5).columns(0).borders = [:top, :right]
		row(1..5).columns(2).align = :center
		row(5).columns(1..2).font_style = :bold
		row(0..5).columns(0..2).size = 11
		end
	elsif @szkolenie.rodzaj_id == 2	
		table tabela_zaw_rob do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(5).columns(0).borders = [:top, :right]
		row(1..5).columns(2).align = :center
		row(5).columns(1..2).font_style = :bold
		row(0..5).columns(0..2).size = 11
		end
	elsif @szkolenie.rodzaj_id == 3
		table tabela_zaw_inz do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(5).columns(0).borders = [:top, :right]
		row(1..5).columns(2).align = :center
		row(5).columns(1..2).font_style = :bold
		row(0..5).columns(0..2).size = 11
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

def tekst
	text "UCZESTNICY SZKOLENIA:", :align => :left, size: 16, :indent_paragraphs => 50, style: :bold
end

def tabela2

	ilosc = @osoba.count
	@wysokosc = 40 + 25*ilosc

		table uczestnicy, :position => :center do
		row(0).font_style = :bold
		row(0).columns(1).width = 200
		row(0).columns(2..3).width = 114
		cells.align = :center
		self.header = true
		end
end
 
def uczestnicy
	
	[["Lp","Nazwisko i imię","Wynik ogólny", "Numer zaświadczenia"]] +
	@osoba.map.with_index do |osoba, index|
		if osoba.osoba_ocena.to_i < 50 && osoba.rodzaj_id == 1 && osoba.nr_zaswiadczenia == 0
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "NDST", ""]
		elsif osoba.osoba_ocena.to_i > 50 && osoba.osoba_ocena.to_i < 60 && osoba.rodzaj_id == 1
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "DST", "#{osoba.nr_zaswiadczenia}/AB/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i > 59 && osoba.osoba_ocena.to_i < 79 && osoba.rodzaj_id == 1 
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "DB", "#{osoba.nr_zaswiadczenia}/AB/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i > 80 && osoba.rodzaj_id == 1 
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "BDB", "#{osoba.nr_zaswiadczenia}/AB/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i < 50 && osoba.rodzaj_id == 2 && osoba.nr_zaswiadczenia == 0
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "NDST", ""]
		elsif osoba.osoba_ocena.to_i > 50 && osoba.osoba_ocena.to_i < 60 && osoba.rodzaj_id == 2 
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "DST", "#{osoba.nr_zaswiadczenia}/R/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i > 59 && osoba.osoba_ocena.to_i < 79 && osoba.rodzaj_id == 2 
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "DB", "#{osoba.nr_zaswiadczenia}/R/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i > 80 && osoba.rodzaj_id == 2
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "BDB", "#{osoba.nr_zaswiadczenia}/R/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i < 50 && osoba.rodzaj_id == 3 && osoba.nr_zaswiadczenia == 0
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "NDST", ""]
		elsif osoba.osoba_ocena.to_i > 50 && osoba.osoba_ocena.to_i < 60 && osoba.rodzaj_id == 3
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "DST", "#{osoba.nr_zaswiadczenia}/IT/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i > 59 && osoba.osoba_ocena.to_i < 79 && osoba.rodzaj_id == 3
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "DB", "#{osoba.nr_zaswiadczenia}/IT/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i > 80 && osoba.rodzaj_id == 3 && osoba.nr_zaswiadczenia <= 1
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "BDB", "#{osoba.nr_zaswiadczenia}/IT/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i < 50 && osoba.rodzaj_id == 4 && osoba.nr_zaswiadczenia == 0
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "NDST", ""]
		elsif osoba.osoba_ocena.to_i > 50 && osoba.osoba_ocena.to_i < 60 && osoba.rodzaj_id == 4
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "DST", "#{osoba.nr_zaswiadczenia}/K/#{@szkolenie.szkolenie_id}#{@data2}"]
		elsif osoba.osoba_ocena.to_i > 59 && osoba.osoba_ocena.to_i < 79 && osoba.rodzaj_id == 4
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "DB", "#{osoba.nr_zaswiadczenia}/K/#{@szkolenie.szkolenie_id}#{@data2}"]
		else 
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "BDB", "#{osoba.nr_zaswiadczenia}/K/#{@szkolenie.szkolenie_id}#{@data2}"]		
		end
	end

end

def podsumowanie
	move_down 25
	text "SPRAWOZDANIE Z KURSU:", :align => :left, size: 16, :indent_paragraphs => 50, style: :bold
	ilosc = @osoba.count
	wysokosc = 40 + 30*ilosc
	@wys = 680 - wysokosc - 40


		if @szkolenie.rodzaj_id == 4
			table podsumowanie_tabela_prac, :position => :center do
			row(0..2).font_style = :bold
			row(0..2).size = 11
			cells.align = :center
			self.header = true
			end
		else
			table podsumowanie_tabela, :position => :center do
			row(0..2).font_style = :bold
			row(0..2).size = 11
			cells.align = :center
			self.header = true
			end
		end
	
end

def podsumowanie_tabela

	$nieuki = 0
	$i = 0
	while $i < @osoba.count
		if @osoba[$i].osoba_ocena.to_i < 50
			$nieuki +=1
			$i +=1
		else
			$i +=1
		end
	end

	[[{:content => "Czas trwania", :colspan => 2}, {:content => "Liczba", :colspan => 2}, {:content => "Liczba uczestników", :colspan => 2}, "Liczba wyd. zaśw.", "Uwagi"],
	["OD","DO","DNI","GODZIN","Rozpoczynających", "Kończących","",""],
	["#{@data_od}","#{@data_do}","#{@dni}","8", "#{@osoba.count}","#{@osoba.count - $nieuki}","#{@osoba.count - $nieuki}", "" ]]
end

def podsumowanie_tabela_prac

	$nieuki = 0
	$i = 0
	while $i < @osoba.count
		if @osoba[$i].osoba_ocena.to_i < 50
			$nieuki +=1
			$i +=1
		else
			$i +=1
		end
	end

	[[{:content => "Czas trwania", :colspan => 2}, {:content => "Liczba", :colspan => 2}, {:content => "Liczba uczestników", :colspan => 2}, "Liczba wyd. zaśw.", "Uwagi"],
	["OD","DO","DNI","GODZIN","Rozpoczynających", "Kończących","",""],
	["#{@data_od}","#{@data_do}","#{@dni}","16", "#{@osoba.count}","#{@osoba.count - $nieuki}","#{@osoba.count - $nieuki}", "" ]]
end

def organizator
	move_down 30
		text "ORGANIZATOR:", :align => :left, size: 16, :indent_paragraphs => 50, style: :bold
		text "KURSU:", :align => :left, size: 16, :indent_paragraphs => 77, style: :bold
	move_down 40
		text "____________", :align => :left, size: 16, :indent_paragraphs => 50, style: :bold

end

def oceny
	move_down 10
	text "Ustala się następujące warunki zaliczenia egzaminu:", :align => :left, size: 12, :indent_paragraphs => 50
	text "80-100 % poprawnych odpowiedzi – ocena bardzo dobra.", :align => :left, size: 12, :indent_paragraphs => 50
	text "60-80 % poprawnych   odpowiedzi – ocena dobra ", :align => :left, size: 12, :indent_paragraphs => 50
	text "50-60 % poprawnych odpowiedzi – ocena dostateczna,", :align => :left, size: 12, :indent_paragraphs => 50 
	text "Poniżej 50 % poprawnych odpowiedzi – ocena niedostateczna.", :align => :left, size: 12, :indent_paragraphs => 50

end



end

