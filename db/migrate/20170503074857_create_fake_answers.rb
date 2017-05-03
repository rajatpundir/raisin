class CreateFakeAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :fake_answers do |t|
    	t.text :message, :null => false
    	t.references :objective_question
      t.timestamps
    end
  end
end
