class CreateNotifications < ActiveRecord::Migration[5.0]

  def change
    create_table :notifications do |t|
    	t.text :message
    	t.references :floor
    	t.references :hidden_floor
      t.timestamps
    end
  end
  
end
