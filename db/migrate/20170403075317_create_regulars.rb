class CreateRegulars < ActiveRecord::Migration[5.0]
  def change
    create_table :regulars do |t|

      t.timestamps
    end
  end
end
