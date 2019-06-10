class AddStanowiskoToOsoba < ActiveRecord::Migration[5.1]
  def change
    add_column :osobas, :stanowisko, :string
  end
end
