class CreateVoters < ActiveRecord::Migration[5.0]
  def change
    create_table :voters do |t|
    	t.string :username, :null => false
    	t.references :option
      t.timestamps
    end
  end
end
