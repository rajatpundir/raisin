class CreateModeratorPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :moderator_posts do |t|
    	t.string :message, :null => false
    	t.references :moderator_topic
      t.timestamps
    end
  end
end
