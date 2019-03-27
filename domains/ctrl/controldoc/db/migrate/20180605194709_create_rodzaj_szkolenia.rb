class CreateRodzajSzkolenia < ActiveRecord::Migration[5.1]
  def up
    create_table :rodzaj_szkolenia do |t|
    	t.string "typ"
      t.timestamps
    end
  end

  def down
  	drop_table :rodzaj_szkolenia
  end
end
