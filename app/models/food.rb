class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :food_hozon

  validates :food_name, :explanation, :image, :price, :sell_by, presence: true
  validates :area_id, numericality: { other_than: 0 }
  validates :food_hozon_id, numericality: { other_than: 1 }
end
