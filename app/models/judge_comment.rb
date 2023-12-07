class JudgeComment < ApplicationRecord
  belong_to :user
  belong_to :judge
end
