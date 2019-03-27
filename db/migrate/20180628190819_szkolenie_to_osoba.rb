class SzkolenieToOsoba < ActiveRecord::Migration[5.1]
def change

  add_reference   :osobas, :szkolenie, index: true
  add_foreign_key :osobas, :szkolenies

end
end
