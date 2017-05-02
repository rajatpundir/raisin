class CreateGlobalTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :global_topics do |t|
    	t.string :title, :null => false
    	t.text :message
    	t.references :tower
      t.timestamps
    end
  end
end
