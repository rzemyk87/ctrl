class AddConfimToOsobas < ActiveRecord::Migration[5.1]
  def change
    add_column :osobas, :confirm, :boolean, default: false
  end
end
