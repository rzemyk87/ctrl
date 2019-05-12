class Firma < ApplicationRecord

	has_many :uzytkowniks

	accepts_nested_attributes_for :uzytkowniks, allow_destroy: true
end
