class CreateOsobas < ActiveRecord::Migration[5.1]
  def up
    create_table :osobas do |t|
    	t.string "osoba_imie"
    	t.string "osoba_nazwisko"    	
    	t.string "osoba_data"
    	t.string "osoba_miejsce"
    	t.string "osoba_ocena"
      t.timestamps
    end
  end

  def down
  	drop_table :osobas
  end
end
