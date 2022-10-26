FactoryBot.define do
  factory :item do
    product_name { "あああ" }
    product_description {'test'}
    price {5000}
    category_id {2}
    condition_id {2}
    contribution_id {2}
    prefecture_id {2}
    day_id {2}
   
    association :user 
  end
end