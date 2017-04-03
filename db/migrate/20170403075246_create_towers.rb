class CreateTowers < ActiveRecord::Migration[5.0]
  def change
    create_table :towers do |t|

      t.timestamps
    end
  end
end
