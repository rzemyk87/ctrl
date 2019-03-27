class CreateUzytkowniks < ActiveRecord::Migration[5.1]
  def up
    create_table :uzytkowniks do |t|
    	t.string "Imie", :limit=>20
    	t.string "Nazwisko", :limit=>60
    	t.string "Uzytkownik", :limit=>25
    	t.string "email", :limit=>100, :default=> "", :null =>false
    	t.string "password_digest"
      t.timestamps
    end
    add_index("uzytkowniks", "Uzytkownik")
  end

  def down
  	drop_table :uzytkowniks
  end
end
