class JudgeComment < ApplicationRecord
  belongs_to :user
  belongs_to :judge
  
  validates :comment, presence: true
end
