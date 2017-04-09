class CreateTags < ActiveRecord::Migration[5.0]

  def change
    create_table :tags do |t|
    	t.text :message
    	t.references :floor
    	t.references :hidden_floor
      t.timestamps
    end
  end
  
end
