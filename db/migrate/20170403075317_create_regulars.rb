class CreateRegulars < ActiveRecord::Migration[5.0]

  def change
    create_table :regulars do |t|
    	t.text :username,:null => false, :unique => true
    	t.text :first_name
    	t.text :last_name
    	t.references :floor
    	t.string :password_digest
    	t.timestamps
    end
  end
  
end
