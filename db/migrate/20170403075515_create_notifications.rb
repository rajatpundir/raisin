class CreateNotifications < ActiveRecord::Migration[5.0]

  def change
    create_table :notifications do |t|
    	t.string :title, :null => false
    	t.text :message
    	t.references :floor
      t.timestamps
    end
  end
  
end
