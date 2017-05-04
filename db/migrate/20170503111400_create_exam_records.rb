class CreateExamRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_records do |t|
    	t.text :attempted_questions, :default => ""
    	t.integer :score, :default => 0
      t.datetime :test_started_at
    	t.references :objective_test
      t.references :regular
      t.timestamps
    end
  end
end
