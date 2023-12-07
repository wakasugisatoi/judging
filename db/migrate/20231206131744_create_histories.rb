class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.integer :year, null:false
      t.timestamps
    end
  end
end
