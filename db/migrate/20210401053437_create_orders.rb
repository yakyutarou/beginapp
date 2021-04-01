class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :miyoji,             null: false, default: ""
      t.string     :namae,              null: false, default: ""
      t.string     :kana_miyoji,        null: false, default: ""
      t.string     :kana_namae,         null: false, default: ""
      t.integer    :age,                null: false
      t.string     :postal_code,        null: false
      t.string     :area,               null: false, default: ""
      t.string     :city,               null:false, default: ""
      t.string     :address,            null:false, default: ""
      t.string     :building_name
      t.string     :phone_number,       null: false, default: ""
      t.references :buy,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
