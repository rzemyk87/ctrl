class CreateFirmas < ActiveRecord::Migration[5.1]
  def up
    create_table :firmas do |t|
    	t.integer "firma_id"
    	t.string "log_in", :limit=>20
    	t.string "Nazwa", :limit=>100
    	t.string "NIP", :limit=>16, :null =>false

      t.timestamps
    end

  end

  def down
  	drop_table :firmas
  end
end
