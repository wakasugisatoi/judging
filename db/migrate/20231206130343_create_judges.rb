class CreateJudges < ActiveRecord::Migration[6.1]
  def change
    create_table :judges do |t|
      t.integer :user_id, null:false
      t.integer :comedian_id, null:false
      t.integer :history_id, null:false #編集するかも
      t.integer :point, null:false
      t.text :impression, null:false
      t.timestamps
    end
  end
end
