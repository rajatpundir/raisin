class CreateTopics < ActiveRecord::Migration[5.0]

  def change
    create_table :topics do |t|
    	t.string :title, :null => false
    	t.references :forum
      t.timestamps
    end
  end
  
end
