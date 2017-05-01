class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
    	t.string :message
    	t.references :poll
      t.timestamps
    end
  end
end
