FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '0a0a0a' }
    password_confirmation { password }
  end
end
