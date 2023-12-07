class CreateJudgeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :judge_comments do |t|
      t.integer :user_id, null:false
      t.integer :judge_id, null:false
      t.string :comment, null:false
      t.timestamps
    end
  end
end
