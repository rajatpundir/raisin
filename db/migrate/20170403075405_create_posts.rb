class CreatePosts < ActiveRecord::Migration[5.0]

  def change
    create_table :posts do |t|
    	t.string :message, :null => false
    	t.string :origin
    	t.references :topic
      t.timestamps
    end
  end
  
end
