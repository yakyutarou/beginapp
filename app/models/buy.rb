class Buy < ApplicationRecord
  belongs_to :food
  belongs_to :user
  has_one :order
end
