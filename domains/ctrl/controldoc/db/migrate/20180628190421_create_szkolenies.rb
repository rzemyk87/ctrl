class CreateSzkolenies < ActiveRecord::Migration[5.1]
  def up
    create_table :szkolenies do |t|
    	t.integer "kurs_id"
    	t.integer "szkolenie_id"
    	t.string "prowadzacy"
    	t.string "firma"
    	t.date "data_od"
    	t.date "data_do"
    	t.string "rodzaj_szkolenia"
    	t.string "data_wystawienia"

      t.timestamps
    end
  end

  def down
  	 drop_table :szkolenies
  end
end
