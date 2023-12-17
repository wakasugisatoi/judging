class Judge < ApplicationRecord
  belongs_to :user
  belongs_to :comedian
  belongs_to :history
  has_many :judge_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :point, presence: true
  validates :impression, length: { in: 1..300 }
  validates :history_id, presence: true
  validates :comedian_id, presence: true
  
  def favorited_by?(user)
    return false unless user && user.id
    favorites.exists?(user_id: user.id)
  end
  
end
