class JudgeComment < ApplicationRecord
  belongs_to :user
  belongs_to :judge
end
