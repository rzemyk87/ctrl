class AddPasswordReset < ActiveRecord::Migration[5.1]
  def change
  	add_column :uzytkowniks, :reset_password_token, :string
  end
end
