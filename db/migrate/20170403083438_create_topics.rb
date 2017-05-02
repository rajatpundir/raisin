class CreateTopics < ActiveRecord::Migration[5.0]

  def change
    create_table :topics do |t|
    	t.string :title, :null => false
    	t.text :message
    	t.string :origin
    	t.references :floor
      t.timestamps
    end
  end
  
end
