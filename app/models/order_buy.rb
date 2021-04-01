class OrderBuy
  include ActiveModel::Model
  attr_accessor :miyoji,:namae,:kana_namae,:kana_miyoji,:age,:postal_code, :area, :city, :address, :building_name, :phone_number, :user_id, :item_id
  # 後で追加:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :miyoji,:namae,:kana_namae,:kana_miyoji,:age,:ara,:city, :address
    validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/ } # 携帯番号・固定電話両方可、ハイフンなし
    validates :user_id, :item_id
  end
end