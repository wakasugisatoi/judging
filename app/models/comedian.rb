class Comedian < ApplicationRecord
  has_many :judge, dependent: :destroy
  belong_to :history
end
