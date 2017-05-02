class CreateGlobalPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :global_posts do |t|
    	t.string :message, :null => false
    	t.references :global_topic
      t.timestamps
    end
  end
end
