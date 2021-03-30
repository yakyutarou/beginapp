class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string  :food_name,             null: false, default: ""
      t.text    :explanation,           null: false
      t.integer :price,                 null: false
      t.integer :area_id,               null: false
      t.integer :sell_by,               null: false
      t.integer :food_hozon_id,         null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
