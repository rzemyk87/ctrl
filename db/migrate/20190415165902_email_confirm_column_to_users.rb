class EmailConfirmColumnToUsers < ActiveRecord::Migration[5.1]
 def change
    add_column :uzytkowniks, :email_confirmed, :boolean, :default => false
    add_column :uzytkowniks, :confirm_token, :string
 end
end
