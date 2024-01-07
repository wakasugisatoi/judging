class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :judges, dependent: :destroy
  has_many :judge_comments, dependent: :destroy
  has_many :favorites,dependent: :destroy
  
  has_one_attached :image
  
  validates :name, presence: true
  validates :introduction, length: { maximum: 150 }
  
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'Guest User'
    end
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/icon.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [400, 400]).processed
  end
  
  def already_favorited?(judge)
    self.favorites.exists?(judge_id: judge.id)
  end
end
