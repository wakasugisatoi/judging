class Judge < ApplicationRecord
  belongs_to :user
  belongs_to :comedian
  belongs_to :history
  has_many :judge_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :point, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :impression, presence: true, length: { in: 1..300 }
  
  def favorited_by?(user)
    return false unless user && user.id
    favorites.exists?(user_id: user.id)
  end
  
end
