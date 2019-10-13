class Firma < ApplicationRecord

	has_many :uzytkowniks

	has_one_attached :avatar
  
	accepts_nested_attributes_for :uzytkowniks, allow_destroy: true

	validates :log_in,
		:uniqueness => {:in => true, :message => " - Podany login już istnieje" }

		validates :NIP,
		:uniqueness => {:in => true, :message => " - Podany NIP już istnieje" }
end
