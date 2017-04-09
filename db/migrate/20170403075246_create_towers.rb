class CreateTowers < ActiveRecord::Migration[5.0]

  def change
  	create_table :towers do |t|
    	t.text :towername,:null => false, :unique => true
		t.string :password_digest
  		t.timestamps
  	end
  end

end
