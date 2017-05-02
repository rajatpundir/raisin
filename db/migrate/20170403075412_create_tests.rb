class CreateTests < ActiveRecord::Migration[5.0]

  def change
    create_table :tests do |t|
    	t.string :origin
    	t.references :floor
      t.timestamps
    end
  end
  
end
