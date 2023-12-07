class Judge < ApplicationRecord
  belong_to :user
  has_many :judge_comment, dependent: :destroy
end
