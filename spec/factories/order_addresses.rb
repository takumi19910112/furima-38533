FactoryBot.define do
  factory :order_address do
    post_code { "123-4567" }
    prefecture_id {2}
    municipalities {"博多区"}
    address {"月隈"}
    building_name {"なんちゃらビル"}
    phone_number {"08052727349"}
    user_id {2}
    item_id {2}
    token{}
   
    association :user 
  end
end
