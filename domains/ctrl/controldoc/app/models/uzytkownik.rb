class Uzytkownik < ApplicationRecord
	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :imie,
				:presence => {:in => true, :message => "pole nie musi być puste" }

	validates :nazwisko,
				:presence => {:in => true, :message => "pole nie musi być puste" }

	validates :uzytkownik,
				:length => {:within => 4..25, :message => "nawza uzytkownika musi miec min 4 a max 25 znakow" },
				:uniqueness => true

	validates :email,
				:presence => true,
				:length => {:maximum => 100},
				:format => {:with => EMAIL_REGEX, :message => "niepoprawny format email" },
				:confirmation => true

	scope :sortuj, lambda{order("nazwisko ASC, imie ASC")}

end	

