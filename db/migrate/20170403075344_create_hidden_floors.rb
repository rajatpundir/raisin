class CreateHiddenFloors < ActiveRecord::Migration[5.0]
  def change
    create_table :hidden_floors do |t|

      t.timestamps
    end
  end
end
