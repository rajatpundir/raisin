class CreateSubjectives < ActiveRecord::Migration[5.0]
  def change
    create_table :subjectives do |t|

      t.timestamps
    end
  end
end
