class SzkolenieToRodzaj < ActiveRecord::Migration[5.1]
def change

  add_reference   :szkolenies, :rodzaj, index: true
  add_foreign_key :szkolenies, :rodzajs

end
end
