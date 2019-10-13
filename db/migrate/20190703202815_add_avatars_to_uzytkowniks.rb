class AddAvatarsToUzytkowniks < ActiveRecord::Migration[5.2]
  def self.up
    change_table :uzytkowniks do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :uzytkowniks, :avatar
  end
end
