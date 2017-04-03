class CreateAdministrators < ActiveRecord::Migration[5.0]

  def change
    create_table :administrators do |t|
		t.text :username,:null => false, :unique => true
  		t.timestamps
    end
  end
  
end
