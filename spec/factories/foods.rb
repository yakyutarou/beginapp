FactoryBot.define do
  factory :food do
    food_name              { 'みかん' }
    explanation            { '甘い' }
    price                  { 1000 }
    area_id                { 1 }
    sell_by                { 10 }
    food_hozon_id          { 2 }

    association :user

    after(:build) do |food|
      food.image.attach(io: File.open('public/images/aji.jpeg'), filename: 'aji.jpeg')
    end
  end
end
