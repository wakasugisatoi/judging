class History < ApplicationRecord
  has_many :comedian, dependent: :destroy
end
