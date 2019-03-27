class SzkolenieToFirma < ActiveRecord::Migration[5.1]
def change

  add_reference   :szkolenies, :firma, index: true
  add_foreign_key :szkolenies, :firmas

end
end
