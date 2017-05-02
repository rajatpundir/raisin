class CreateModeratorTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :moderator_topics do |t|
    	t.string :title, :null => false
    	t.text :message
    	t.string :origin
    	t.references :tower
      t.timestamps
    end
  end
end
