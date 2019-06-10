class WstepnePdf < Prawn::Document
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
    organizator
    header
    tabela1
 	next_page
    tabela

  end

  def organizator
  	move_down 20
	text "(nazwa pracodawcy - pieczęć) ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 40
  end

  def header
  		move_down 25
  		text "KARTA SZKOLENIA WSTĘPNEGO", size: 16, style: :bold, :align => :center
 		move_down 5
  		text "W DZIEDZINIE BEZPIECZEŃSTWA I HIGIENY PRACY", size: 16, style: :bold, :align => :center
  		move_down 25
  end

  def tabela1
	bounding_box([50, 620], :width => 450, :height => 650) do
		text_box "<b>3. Instruktaż ogólny</b>", :size => 10, :at => [10,482], :rotate => 90, :inline_format => true
		text_box "<b>3. Instruktaż stanowiskowy</b>", :size => 10, :at => [10,250], :rotate => 90, :inline_format => true
		table tabela_zaw1 do
		cells.style :inline_format => :true, :padding => 12
		row(0..2).font_style = :bold
		row(0..1).align = :left
		row(2).columns(0).width = 30
		row(2).columns(1).width = 420
		end

	move_down 5
   	text "<color rgb='#FFFFFF'>`</color>   *     Podpis stanowi potwierdzenie odbycia instruktażu i zapoznania się z przepisami 
   	<color rgb='#FFFFFF'>`</color>           oraz zasadami bezpieczeństwa i higieny pracy dotyczącymi wykonywania prac.", size: 10, :align => :left, :inline_format => true
   	move_down 1
   	text "<color rgb='#FFFFFF'>`</color>   **    Wypełnić w przypadkach, o których mowa w §11 ust.1 pkt 2 i ust. 2 i 3 rozpocządzenia 
   	<color rgb='#FFFFFF'>`</color>           Ministra Gospodarki i Pracy z dnia 27 lipca 2004 r. w sprawie szkolenia w dziedzinie 
   	<color rgb='#FFFFFF'>`</color>           bezpieczeństwa i higieny pracy.", size: 10, :align => :left, :inline_format => true
 
	end
end

def tabela_zaw1
[
	[{:content => "1. Imię i nazwisko osoby odbywającej szkolenie:   <color rgb='003da5'>#{@osoba.osoba_imie} #{@osoba.osoba_nazwisko}</color>", :colspan => 2}],
	[{:content => "2. Nazwa komórki organizacyjnej:   <color rgb='003da5'>#{@szkolenie.firma}</color>", :colspan => 2}],
	["", "Instruktaż ogólny przeprowadził w dniu: <color rgb='003da5'>#{@data_od}</color>

		<color rgb='003da5'>   #{@szkolenie.prowadzacy}</color> 
		<font-size='6'>   (imię i nazwisko przeprowadzającego instruktaż)</font>                                             ..............................................
		<color rgb='#FFFFFF'>`</color>                                                                                                     <font-size='6'>   (podpis osoby, której udzielono instruktażu*)</font>"],
	[{:content => "", :rowspan => 2}, "1) Instruktaż na stanowisku pracy <color rgb='003da5'><b>#{@osoba.stanowisko}</b></color> przeprowadził w dniach 
		#{@data_od} - #{@data_do} r. <color rgb='003da5'><b>#{@szkolenie.prowadzacy}</b></color>
		<color rgb='#FFFFFF'>`</color>                                               <font-size='6'>   (imię i nazwisko przeprowadzającego instruktażu*)</font>

		Po przeprowadzeniu sprawdzianu wiadomości i umiejętnosći z zakresu 
		wykonywania pracy zgodnie z przepisami i zasadami bezpieczeństwa 
		i higieny pracy Pan(i) <color rgb='003da5'><b>#{@osoba.osoba_imie} #{@osoba.osoba_nazwisko}</b></color> został(a) dopuszczony(a)
		do wykonywania pracy na stanowisku <color rgb='003da5'><b>#{@osoba.stanowisko}</b></color> .

			.....................................................                                   .....................................................
		<color rgb='#FFFFFF'>`</color>    <font-size='6'>(podpis osoby, której udzielono instruktażu*)</font>                                            <font-size='6'>(data i podpis kierownika komórki organizacyjnej)</font>"], 

	["2)** Instruktaż stanowiskowy na stanowisku pracy <color rgb='003da5'><b>#{@osoba.stanowisko}</b></color>
		przeprowadził w dniach #{@data_od} - #{@data_do} r. <color rgb='003da5'><b>#{@szkolenie.prowadzacy}</b></color>
		<color rgb='#FFFFFF'>`</color>                                                                                             <font-size='6'>(imię i nazwisko przeprowadzającego instruktażu*)</font>
	
	Po przeprowadzeniu sprawdzianu wiadomości i umiejętności 
	z zakresu wykonywania pracy zgodnie z przepisami i zasadami bezpieczeństwa
	i higieny pracy Pan(i) <color rgb='003da5'><b>#{@osoba.osoba_imie} #{@osoba.osoba_nazwisko}</b></color> został(a) dopuszczony(a)
	do wykonywania pracy na stanowisku <color rgb='003da5'><b>#{@osoba.stanowisko}</b></color> .

	.....................................................                                   .....................................................
	<color rgb='#FFFFFF'>`</color>    <font-size='6'>(podpis osoby, której udzielono instruktażu*)</font>                                            <font-size='6'>(data i podpis kierownika komórki organizacyjnej)</font>"]
]

end

def next_page
	start_new_page
end


def tabela
	bounding_box([50, 700], :width => 450, :height => 650) do
	 text "Program szkolenia:", :align => :left, size: 12, :indent_paragraphs => 46, :style => :bold
      move_down 10
		table tabela_zaw do
		row(0).font_style = :bold
		cells.style :inline_format => :true, :padding => 8
		row(0).columns(1).align = :center
		row(1..13).columns(2).align = :center
		row(1..13).columns(0).font_style = :bold
		end
	end
end

def tabela_zaw
	[["Lp","Temat szkolenia *","Liczba godzin **"],
	["1.", "Istota bezpieczeństwa i higieny pracy.",""],
	["2.", "Zakres obowiązków i uprawnień pracodawcy, pracowników oraz poszczególnych komórek organizacyjnych zakładu pracy i organizacji społecznych w zakresie bezpieczeństwa i higieny pracy."," 0,6"],
    ["3.", "Odpowiedzialność za naruszenie przepisów lub zasad bezpieczeństwa i higieny pracy.",""],
    ["4.", "Zasady poruszania się na terenie zakładu pracy.",""],
	["5.", "Zagrożenia wypadkowe i zagrożenia dla zdrowia występujące w zakładzie i podstawowe środki zapobiegawcze."," 0,5 "],
	["6.", "Podstawowe zasady bezpieczeństwa i higieny pracy związane z obsługą urządzeń technicznych oraz transportem wewnątrzzakładowym."," 0,4 "],
	["7.", "Zasady przydziału odzieży roboczej i obuwia roboczego oraz środków ochrony indywidualnej, w tym odniesieniu do stanowiska pracy instruowanego.",""],
	["8.", "Porządek i czystość w miejscu pracy - ich wpływ na zdrowie i bezpieczeństwo pracownika.","0,5"],
	["9.", "Profilaktyczna opieka lekarska - zasady jej sprawowania w odniesieniu do stanowiska instruowanego.",""],
	["10.", "Podstawowe zasady ochrony przeciwpożarowej oraz postępowania w razie pożaru","1"],
	["11.", "Postępowanie w razie wypadku, w tym organizacja i zasady udzielania pierwszej pomocy.",""],
	["","Razem:","minimum 3"]]


end

end




