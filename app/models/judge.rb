class Judge < ApplicationRecord
  belongs_to :user
  belongs_to :comedian
  has_many :judge_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
