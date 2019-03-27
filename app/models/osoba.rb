class Osoba < ApplicationRecord

	    belongs_to :szkolenie

	    scope :sortuj, lambda{order("osobas.id ASC")}

	def self.search(search_osoba)
  		where("osoba_imie LIKE ? OR osoba_nazwisko LIKE ?", "%#{search_osoba}%", "%#{search_osoba}%") 
	end

end
