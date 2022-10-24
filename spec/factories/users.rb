FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_day             {Faker::Date.birthday}
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    read_first            {"タナカ"}
    read_last             {"タロウ"}

  end
end