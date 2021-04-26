FactoryBot.define do
  factory :order_buy do
    myouji                { '山田' }
    namae                 { '太郎' }
    kana_myouji           { 'ヤマダ' }
    kana_namae            { 'タロウ' }
    age                   { '65' }
    postal_code           { '1235678' }
    area                  { '北海道' }
    city                  { '旭川市' }
    address               { '浅野3-5-308' }
    building_name         { 'マンション団地' }
    phone_number          { '09045367896' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end
