class Uzytkownik < ApplicationRecord
	before_create :confirmation_token

	has_secure_password

	belongs_to :firma

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :imie,
				:presence => {:in => true, :message => "pole nie może być puste" }

	validates :nazwisko,
				:presence => {:in => true, :message => "pole nie może być puste" }

	validates :uzytkownik,
				:length => {:within => 4..25, :message => "nawza uzytkownika musi miec min 4 a max 25 znakow" },
				:uniqueness => true

	validates :email,
				:presence => true,
				:length => {:maximum => 100},
				:format => {:with => EMAIL_REGEX, :message => "niepoprawny format email" },
				:confirmation => true

	scope :sortuj, lambda{order("nazwisko ASC, imie ASC")}

def email_activate
   	self.email_confirmed = true
   	self.confirm_token = nil
   	save!(:validate => false)
end

private

	def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
	end

end	

