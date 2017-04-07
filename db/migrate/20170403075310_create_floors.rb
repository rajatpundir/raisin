class CreateFloors < ActiveRecord::Migration[5.0]

  def change
    create_table :floors do |t|
    	t.text :contains
    	t.references :administrator
    	t.timestamps
    end
  end
  
end
