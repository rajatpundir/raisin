class CreateForums < ActiveRecord::Migration[5.0]

  def change
    create_table :forums do |t|
    	t.references :floor
      t.timestamps
    end
  end
  
end
