class AddToFirmas < ActiveRecord::Migration[5.1]
  def change
  	add_column :firmas, :adres, :string
  	add_column :firmas, :poczta, :string
  	add_column :firmas, :miasto, :string
  	add_column :firmas, :tekst, :string 
  end
end
