class FoodHozon < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '常温' },
    { id: 3, name: '冷蔵' },
    { id: 4, name: '冷凍' }
  ]

  include ActiveHash::Associations
  has_many :foods
end
