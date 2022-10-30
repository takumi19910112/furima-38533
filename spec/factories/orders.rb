FactoryBot.define do
  factory :order do
    user_id            {2}
    item_id            {2}

    association :user 
    association :item 
    association :address
  end
end
