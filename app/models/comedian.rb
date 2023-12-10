class Comedian < ApplicationRecord
  has_many :judges, dependent: :destroy
  belongs_to :history
end
