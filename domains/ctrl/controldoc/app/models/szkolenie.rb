class Szkolenie < ApplicationRecord

	has_many :osobas

    accepts_nested_attributes_for :osobas, allow_destroy: true

    scope :sortuj, lambda{order("szkolenies.id ASC")}
    scope :najnowsze, lambda{order("szkolenies.id DESC")}

def self.search(search_firma, search_prowadzacy, search_data, search_imie, search_nazwisko)
	joins(:osobas).where("firma LIKE ? AND prowadzacy LIKE ? AND data_od LIKE ? AND osoba_imie LIKE ? AND osoba_nazwisko LIKE ?", "%#{search_firma}%", "%#{search_prowadzacy}%","%#{search_data}%","%#{search_imie}%", "%#{search_nazwisko}%") 
end


end
