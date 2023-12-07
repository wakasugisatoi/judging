class CreateComedians < ActiveRecord::Migration[6.1]
  def change
    create_table :comedians do |t|
      t.integer :history_id, null:false
      t.string :name, null:false
      t.timestamps
    end
  end
end
