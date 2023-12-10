class Judge < ApplicationRecord
  belongs_to :user
  belongs_to :comedian
  belongs_to :history　#編集するかも
  has_many :judge_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
