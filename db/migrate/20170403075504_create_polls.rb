class CreatePolls < ActiveRecord::Migration[5.0]

  def change
    create_table :polls do |t|
    	t.string :title, :null => false
    	t.text :message
    	t.references :floor
      t.timestamps
    end
  end
  
end
