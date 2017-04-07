class CreatePolls < ActiveRecord::Migration[5.0]

  def change
    create_table :polls do |t|
    	t.references :floor
    	t.references :hidden_floor
      t.timestamps
    end
  end
  
end
