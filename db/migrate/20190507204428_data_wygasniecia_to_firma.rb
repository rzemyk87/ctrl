class DataWygasnieciaToFirma < ActiveRecord::Migration[5.1]
  def change
  	add_column :firmas, :data_wygasniecia, :date
  	add_column :firmas, :aktywna, :boolean
  end
end
