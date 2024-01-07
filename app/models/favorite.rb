class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :judge
  validates_uniqueness_of :judge_id, scope: :user_id
end
