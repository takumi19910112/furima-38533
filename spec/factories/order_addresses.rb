FactoryBot.define do
  factory :order_address do
    post_code { "123-4567" }
    prefecture_id {2}
    municipalities {"博多区"}
    address {"月隈"}
    building_name {"なんちゃらビル"}
    phone_number {"18052727349"}
   
    token{"fjr8ghkd5ntible3flai4jege0fe234"}
   
   
  end
end
