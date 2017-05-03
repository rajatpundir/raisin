class CreateObjectiveQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :objective_questions do |t|
    	t.text :message, :null => false
    	t.text :answer, :null => false
    	t.references :objective_test
      t.timestamps
    end
  end
end
