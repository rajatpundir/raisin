class CreateTags < ActiveRecord::Migration[5.0]

  def change
    create_table :tags do |t|
    	t.string :title
    	t.text :message
    	t.string :origin
    	t.references :floor
      t.timestamps
    end
  end
  
end
