class Uprawnienia < ActiveRecord::Migration[5.1]
 def change
    add_column :uzytkowniks, :uprawnienia, :integer
 end
end
