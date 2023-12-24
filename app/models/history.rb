class History < ApplicationRecord
  has_many :comedians, dependent: :destroy
  has_many :judges, dependent: :destroy
  # validates_associated :comedians
  
  #親子関係のあるモデルを同時に扱う，親モデルから子モデルの削除ができる
  accepts_nested_attributes_for :comedians, allow_destroy: true 
  
  validates :year, presence: true
  
end
