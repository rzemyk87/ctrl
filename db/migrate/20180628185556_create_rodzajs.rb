class CreateRodzajs < ActiveRecord::Migration[5.1]
  def up
    create_table :rodzajs do |t|
    	t.string "rodzaj"
      t.timestamps
    end
  end

    def down
  	drop_table :rodzajs
  end
end
