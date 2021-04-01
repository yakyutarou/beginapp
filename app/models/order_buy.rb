class OrderBuy
  include ActiveModel::Model
  attr_accessor :myouji,:namae,:kana_namae,:kana_myouji,:age,:postal_code, :area, :city, :address, :building_name, :phone_number, :user_id, :item_id
  # 後で追加:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :myouji,:namae,:kana_namae,:kana_myouji,:age,:ara,:city, :address
    validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/ } # 携帯番号・固定電話両方可、ハイフンなし
    validates :user_id, :item_id
  end
  
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Order.create(myouji: myouji,namae: namae,kana_myouji:kana_myouji,kana_namae:kana_namae,age:age,postal_code: postal_code, area: area, city: city, address: address, building_name: building_name, phone_number: phone_number, buy: buy)
  end
end