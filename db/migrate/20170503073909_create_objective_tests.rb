class CreateObjectiveTests < ActiveRecord::Migration[5.0]
  def change
    create_table :objective_tests do |t|
    	t.string :title, :null => false
    	t.datetime :start_time
    	t.datetime :end_time
    	t.integer :test_duration
      t.string :origin
    	t.references :floor
      t.timestamps
    end
  end
end
