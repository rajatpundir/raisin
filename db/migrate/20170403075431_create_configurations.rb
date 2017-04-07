class CreateConfigurations < ActiveRecord::Migration[5.0]

  def change
    create_table :configurations do |t|
    	t.references :question
      t.timestamps
    end
  end
  
end
