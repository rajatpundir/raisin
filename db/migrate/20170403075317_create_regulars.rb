class CreateRegulars < ActiveRecord::Migration[5.0]

  def change
    create_table :regulars do |t|
    	t.string :username,:null => false
    	t.string :first_name
    	t.string :last_name
        t.references :floor
        t.references :tower
    	t.string :password_digest
    	t.timestamps
    end
  end
  
end
