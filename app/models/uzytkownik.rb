class Uzytkownik < ApplicationRecord
	before_create :confirmation_token

	has_secure_password

	belongs_to :firma
	has_one_attached :avatar

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :imie,
				:presence => {:in => true, :message => "pole nie może być puste" }

	validates :nazwisko,
				:presence => {:in => true, :message => "pole nie może być puste" }

	validates :uzytkownik,
				:length => {:within => 4..25, :message => "nawza uzytkownika musi miec min 4 a max 25 znakow" },
				:uniqueness => {:in => true, :message => " - Dany login jest zajęty" }

	validates :email,
				:presence => true,
				:length => {:maximum => 100},
				:format => {:with => EMAIL_REGEX, :message => "niepoprawny format email" },
				:confirmation => true,
				:uniqueness => {:in => true, :message => " - Podany email istnieje już w bazie" }

	scope :sortuj, lambda{order("nazwisko ASC, imie ASC")}

def email_activate
   	self.email_confirmed = true
   	self.confirm_token = nil
   	save!(:validate => false)
end

def generate_password_token!
 	self.reset_password_token = generate_token
 	save!(:validate => false)
end

def reset_password
 	self.reset_password_token = nil
   	save!(:validate => false)
end

private

def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
end

def generate_token
      if self.reset_password_token.blank?
          self.reset_password_token = SecureRandom.urlsafe_base64.to_s
      end
end
end	

