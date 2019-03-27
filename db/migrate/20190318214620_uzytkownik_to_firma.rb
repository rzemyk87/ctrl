class UzytkownikToFirma < ActiveRecord::Migration[5.1]
def change

  add_reference   :uzytkowniks, :firma, index: true
  add_foreign_key :uzytkowniks, :firmas

end
end
