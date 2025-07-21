class Reward < ApplicationRecord
  has_many :redemptions
  has_many :users, through: :redemptions
  
  validates :title, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
